require_relative 'board'

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

  def mov_dirs

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

  def symbol
    "\u2656".colorize(color)
  end



end

class Bishop < Piece
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
  def symbol
    "\u2655".colorize(color)
  end
end

class King < Piece
  def symbol
    "\u2654".colorize(color)
  end
end

class NullPiece
  def symbol
    " "
  end
end









# p piece = Piece.new("hello")
# p other = Piece.new
