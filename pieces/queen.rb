require_relative 'slidable'
require_relative 'piece'

class Queen < Piece
  include Slidable

  def to_s
    color == :white ? " \u2655 " : " \u265B "
  end

  def move_dirs
    diagonal_dirs + horizontal_dirs
  end

end
