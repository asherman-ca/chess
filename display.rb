require "colorize"
require_relative "cursor"
# require_relative "board"

class Display

  attr_reader :board, :notifications, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @notifications = {}
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor.selected
      bg = :light_green
    elsif [i, j] == @cursor.cursor_pos
      bg = :light_yellow
    elsif (i + j).odd?
      bg = :light_cyan
    else
      bg = :light_white
    end
    { background: bg }
  end

  # def reset!
  #   @notifications.delete(:error)
  # end
  #
  # def uncheck!
  #   @notifications.delete(:check)
  # end
  #
  # def set_check!
  #   @notifications[:check] = "Check!"
  # end

  def render
    system("clear")
    puts "Arrow keys = move, space to confirm."
    build_grid.each { |row| puts row.join }

    @notifications.each do |key, val|
      puts "#{val}"
    end
  end

end
