
require 'singleton'


class Piece
  attr_accessor :color, :board, :pos, :value

  def initialize(color=nil, board=nil, pos=nil, value = " ")
    @color = color
    @board = board
    @pos = pos
    @value = value
  end

  def moves
    move_arr = []
  end


  def to_s
    "#{symbol}"
  end

  def symbol
    value.colorize(color)
  end

end

module SlidingPiece #need to implement move direction
  #needs to know what directions a piece can move (diag, horiz/vertical, both)

  def moves
    board = self.board
    pos = self.pos

    horizontal = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    diagonal = [[-1, -1], [1, 1], [1, -1], [-1, 1]]
    both = horizontal + diagonal

    move_arr = []

     case self.value
      when :bishop
        movement = diagonal
      when :rook
        movement = horizontal
      when :queen
        movement = both
      end

    movement.each do |pos2|
      x, y = pos
      x2, y2 = pos2
      x, y = (x + x2), (y + y2)
      while board.in_bounds?([x,y]) && board.valid_move?(pos, [x,y])
        move_arr << [x, y]
        break if board.grid[x][y] != NullPiece.instance #breaks once it encounters a piece
        x, y = (x + x2), (y + y2)
      end
    end
    move_arr
  end


end

module SteppingPiece
  #
end

class Pawn < Piece

  def symbol
    "\u2659".colorize(color)
  end

end

class Rook < Piece
  include SlidingPiece

  def symbol
    "\u2656".colorize(color)
  end



end

class Bishop < Piece
  include SlidingPiece

  def symbol
    "\u2657".colorize(color)
  end

end

class Knight < Piece
  def symbol
    "\u2658".colorize(color)
  end
end

class Queen < Piece
  include SlidingPiece

  def symbol
    "\u2655".colorize(color)
  end

end

class King < Piece
  def symbol
    "\u2654".colorize(color)
  end
end

class NullPiece < Piece
  include Singleton

  def symbol
    " "
  end

end









# p piece = Piece.new("hello")
# p other = Piece.new
