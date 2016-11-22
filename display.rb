require_relative 'board'
require 'colorize'
require_relative 'cursor'


class Display
  attr_accessor :cursor

  def initialize
    @cursor = Cursor.new([7,0], board = Board.new)
  end

  def render(board = Board.new)
    (0..7).each do |row|
      row_output = ""
      (0..7).each do |col|
        if [row, col] == @cursor.cursor_pos
          row_output += " #{board.grid[row][col].value} ".colorize(:color => :black, :background => :red)
        else
          if row.even?
            if col.even?
              row_output += " #{board.grid[row][col].value} ".colorize(:background => :light_blue)
            else
              row_output += " #{board.grid[row][col].value} ".colorize(:background => :white)
            end
          else
            if col.odd?
              row_output += " #{board.grid[row][col].value} ".colorize(:background => :light_blue)
            else
              row_output += " #{board.grid[row][col].value} ".colorize(:background => :white)
            end
          end
        end
      end
      puts row_output
    end

  end



end

d = Display.new
d.render


# puts "  #{(0...size).to_a.join(" ")}"
# rows.each_with_index do |row, i|
#   puts "#{i} #{row.join(" ")}"
# end
