require_relative 'slidable'

class Bishop < Piece

  def to_s
    ' Q '
  end

  def move_dirs
    diagonal_dirs
  end

end
