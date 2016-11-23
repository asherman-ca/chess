require_relative 'slidable'
require_relative 'piece'

class Bishop < Piece

  include Slidable

  def to_s
    color == :white ? " \u2657 " : " \u265D "
  end

  def move_dirs
    diagonal_dirs
  end

end
