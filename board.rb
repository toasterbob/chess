require_relative 'piece'

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8, Piece.new) } #Piece.new("-"))}
    populate
  end

  def populate
    [0, 1, 6, 7].each do |row|
      (0..7).each do |col|
        @grid[row][col] = Piece.new("*")
      end
    end
  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos
    x2, y2 = end_pos
    if @grid[x][y].value.nil?
      raise "No piece found at location"
    elsif @grid[x2][y2].nil?
      @grid[x][y], @grid[x2][y2] = @grid[x2][y2], @grid[x][y]
    else

    end

  end

  def in_bounds?(pos)
    i, j = pos
    return false unless (0..7).include?(i) && (0..7).inlcude?(j)
    true
  end

  def render
    

  end







end

board = Board.new
p board.render
# p a
