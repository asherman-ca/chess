class Piece

  attr_reader :pos, :color

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def to_s
    " P "
  end

  def moves
    #refer to subclasses
  end

  def change_coord(coord)
    @pos = coord
  end

  def empty?
    self.is_a?(NullPiece)
  end

  private

  def move_into_check(to_pos)
  end

end
