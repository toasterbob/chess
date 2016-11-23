require_relative 'board'
require 'colorize'
require_relative 'cursor'


class Display
  attr_accessor :cursor, :board, :start, :moves

  def initialize(board = Board.new)
    @board = board
    @cursor = Cursor.new([7,0], board)
    @start = nil
    @finish = nil
    @moves = nil
  end

  def render
    c_color = @cursor.selected ? :green : :yellow
    (0..7).each do |row|
      row_output = ""
      (0..7).each do |col|
        if [row, col] == @cursor.cursor_pos
          row_output += " #{board.grid[row][col].to_s} ".colorize(:color => :black, :background => c_color)
        elsif @start && [row, col] == @start
          row_output += " #{board.grid[row][col].to_s} ".colorize(:color => :black, :background => :green)
        elsif @moves && @moves.include?([row, col])
          row_output += " #{board.grid[row][col].to_s} ".colorize(:color => :black, :background => :light_green)
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



  def move_pieces_cursor
    system("clear")
    render
    p "Please select piece."
    x = 0
    while x < 1000000
      @start = cursor.cursor_pos if @cursor.selected
      @start if @cursor.selected
      a, b = @start if @cursor.selected
      @moves = (@board.grid[a][b].moves) if @cursor.selected
      break if @cursor.selected
      cursor.get_input
      system("clear")
      render
      p "Please select piece."
      x += 1
    end
    system("clear")
    render
    p "Where would you like to move it?"
    while x < 1000000
      @finish = cursor.cursor_pos if !@cursor.selected
      if @start == @finish
        @start = nil
        @finish = nil
        @moves = nil
        move_pieces_cursor
      end
      if @finish
        @board.move_piece(@start, @finish)
        @start = nil
        @finish = nil
        @moves = nil
        move_pieces_cursor
      end
      cursor.get_input
      system("clear")
      render
      p "Where would you like to move it?"
      x += 1
    end
  end

end

d = Display.new
d.render
d.move_pieces_cursor


# puts "  #{(0...size).to_a.join(" ")}"
# rows.each_with_index do |row, i|
#   puts "#{i} #{row.join(" ")}"
# end
