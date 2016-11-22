#require_relative 'board'

class Piece
  attr_accessor :value

  def initialize(value = " ")
    @value = value
  end

end
# p piece = Piece.new("hello")
# p other = Piece.new
