require_relative 'pieces/piece'
require_relative 'display'
require_relative 'pieces/nullpiece'

class Board

  attr_accessor :grid

  def initialize
    null_piece = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) { null_piece } }
    populate_royalty
  end

  def populate_royalty
    @grid.each_with_index do |row, i|
      if i < 2 || i > 5
        row.each_index do |j|
          @grid[i][j] = Piece.new(@grid, [i, j])
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    begin
      raise unless self[end_pos].is_a?(NullPiece)
      raise if self[start_pos].is_a?(NullPiece)

      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    rescue
      puts "Invalid"
    end
  end

  def valid_move?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
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


tester = Board.new
rend = Display.new(tester)
rend.render
rend.actual_method
