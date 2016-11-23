require_relative 'piece'


class Board
  attr_accessor :grid, :null_piece
  def initialize
    @null_piece = NullPiece.instance
    @grid = Array.new(8) { Array.new(8, null_piece) } #Piece.new("-"))}
    populate
  end

  def populate
    pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    value = [:rook, :knight, :bishop, :king, :queen, :bishop, :knight, :rook]
    [0, 1, 6, 7].each do |row|
      (0..7).each do |col|
        if row == 1
          @grid[row][col] = Pawn.new(:red, self, [row,col], :pawn)
        elsif row == 6
          @grid[row][col] = Pawn.new(:black, self, [row,col], :pawn)
        elsif row == 0
          @grid[row][col] = pieces[col].new(:red, self, [row,col], value[col])
        elsif row == 7
          @grid[row][col] = pieces[col].new(:black, self, [row,col], value[col])
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos
    move_list = grid[x][y].moves
    # x2, y2 = end_pos
    # if valid_move?(start_pos, end_pos)
    #   @grid[x][y], @grid[x2][y2] = null_piece, @grid[x][y]
    # end
    if move_list.include?(end_pos)
      x2, y2 = end_pos
      @grid[x][y], @grid[x2][y2] = null_piece, @grid[x][y]
      @grid[x2][y2].pos = [x2, y2] #updated piece's position
      return true
    end
    false
  end

  def in_bounds?(pos)
    i, j = pos
    return false unless (0..7).cover?(i) && (0..7).cover?(j)
    true
  end

  def valid_move?(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    if @grid[x][y].color == nil #should check if color matches player
      return false #no piece at that location
    elsif @grid[x2][y2] == null_piece
      return true #spot open
    elsif @grid[x2][y2] != null_piece
      if @grid[x2][y2].color == @grid[x][y].color
        return false #same color
      else #different color, takes piece
        return true
      end
    end
  end


  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end

  def who
    self
  end

end

#Testing piece moves
# board = Board.new
# board.grid[1][1] = NullPiece.instance
# board.grid[1][3] = NullPiece.instance
# board.grid[1][0] = NullPiece.instance
# board.grid[1][4] = NullPiece.instance
# board.grid[1][5] = NullPiece.instance
# p board.grid[0][2].moves
# p board.grid[0][0].moves
# p board.grid[0][4].moves
# p board.grid[0][1].moves
# p board.grid[0][3].moves
#   board.grid[2][5] = Pawn.new(:red, self, nil, :pawn)
#   board.grid[2][7] = Pawn.new(:red, self, nil, :pawn)
# p board.grid[1][6].moves
# #  board.grid[4][6] = Pawn.new
#   board.grid[5][5] = Pawn.new(:red, self, nil, :pawn)
#   board.grid[5][7] = Pawn.new(:red, self, nil, :pawn)
# p board.grid[6][6].moves
# p board.grid[6][0].value
# p board.move_piece([0,0], [6,0])
# p board.grid[6][0].value
# p board.grid[6][0]
