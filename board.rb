require_relative 'display'
require_relative 'pieces/pieces'

class Board

  attr_accessor :grid

  def initialize
    null_piece = NullPiece.instance
    @grid = Array.new(8) { Array.new(8) { null_piece } }
    populate
  end


  def populate

    @grid.each_with_index do |row,i|
      if i == 0
        row.each_index do |j|
          if j == 0 || j == 7
            @grid[i][j] = Rook.new(self, [i, j], :black)
          elsif j == 1 || j == 6
            @grid[i][j] = Knight.new(self, [i, j], :black)
          elsif j == 2 || j == 5
            @grid[i][j] = Bishop.new(self, [i, j], :black)
          elsif j == 3
            @grid[i][j] = Queen.new(self, [i, j], :black)
          else
            @grid[i][j] = King.new(self, [i,j ], :black)
          end
        end
      elsif i == 1
        row.each_index do |k|
          @grid[i][k] = Pawn.new(self, [i, k], :black)
        end
      elsif i == 7
        row.each_index do |l|
          if l == 0 || l == 7
            @grid[i][l] = Rook.new(self, [i, l], :white)
          elsif l == 1 || l == 6
            @grid[i][l] = Knight.new(self, [i, l], :white)
          elsif l == 2 || l == 5
            @grid[i][l] = Bishop.new(self, [i, l], :white)
          elsif l == 3
            @grid[i][l] = Queen.new(self, [i, l], :white)
          else
            @grid[i][l] = King.new(self, [i, l], :white)
          end
        end
      elsif i == 6
        row.each_index do |k|
          @grid[i][k] = Pawn.new(self, [i, k], :white)
        end
      end
    end
  end


  def move_piece(start_pos, end_pos)
    begin
      raise if self[start_pos].is_a?(NullPiece)

      self[end_pos] = self[start_pos]
      self[end_pos].change_coord(end_pos)
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


# tester = Board.new
# rend = Display.new(tester)
# rend.render
# rend.actual_method
