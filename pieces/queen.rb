require_relative 'slidable'

class Queen < Piece
  include Slidable

  def to_s
    " Q "
  end

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end

end
