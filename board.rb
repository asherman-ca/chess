require_relative 'piece'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { nil } }
    populate_royalty
  end

  def populate_royalty
    @grid.each_with_index do |row, i|
      if i < 2 || i > 5
        row.each_index do |i2|
          @grid[i][i2] = Piece.new
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    begin
      raise unless self[end_pos].nil?
      raise if self[start_pos].nil?

      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    rescue
      puts "Invalid"
    end

  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

end

p test = Board.new
