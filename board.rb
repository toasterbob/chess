require_relative 'piece'

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8, Piece.new) } #Piece.new("-"))}
    populate
  end

  def populate
    pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    [0, 1, 6, 7].each do |row|
      (0..7).each do |col|
        if row == 1
          @grid[row][col] = Pawn.new(:red, nil, nil, "\u2659")
        elsif row == 6
          @grid[row][col] = Pawn.new(:black, nil, nil, "\u2659")
        elsif row == 0
          @grid[row][col] = pieces[col].new(:red, nil, nil, "\u2659")
        elsif row == 7
          @grid[row][col] = pieces[col].new(:black, nil, nil, "\u2659")
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    if @grid[x][y].value == " "
      raise "No piece found at location"
    elsif @grid[x2][y2].nil?
      @grid[x][y], @grid[x2][y2] = @grid[x2][y2], @grid[x][y]
    else
      raise "The piece cannot move to that position"
    end

  end

  def in_bounds?(pos)
    i, j = pos
    return false unless (0..7).cover?(i) && (0..7).cover?(j)
    true
  end

  def render


  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end






end

# board = Board.new
# p board.render
# # p board.grid[0][0] = nil
# p board.move_piece([3,0], [1,1])
# p a
