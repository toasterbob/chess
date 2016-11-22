require_relative 'board'
require 'colorize'
require_relative 'cursor'


class Display
  attr_accessor :cursor

  def initialize(board= Board.new)
    @cursor = Cursor.new([7,0], board)
  end

  def render(board = Board.new)
    (0..7).each do |row|
      row_output = ""
      (0..7).each do |col|
        if [row, col] == @cursor.cursor_pos
          row_output += " #{board.grid[row][col].to_s} ".colorize(:color => :black, :background => :red)
        else
          if row.even?
            if col.even?
              row_output += " #{board.grid[row][col].to_s} ".colorize(:background => :white)
            else
              row_output += " #{board.grid[row][col].to_s} ".colorize(:background => :light_blue)
            end
          else
            if col.odd?
              row_output += " #{board.grid[row][col].to_s} ".colorize(:background => :white)
            else
              row_output += " #{board.grid[row][col].to_s} ".colorize(:background => :light_blue)
            end
          end
        end
      end
      puts row_output
    end

  end

  def move_cursor_test
    system("clear")
    render
    x = 0
    while x < 10
      cursor.get_input
      system("clear")
      render
      x += 1
    end
  end

end

d = Display.new
d.render
#d.move_cursor_test


# puts "  #{(0...size).to_a.join(" ")}"
# rows.each_with_index do |row, i|
#   puts "#{i} #{row.join(" ")}"
# end
