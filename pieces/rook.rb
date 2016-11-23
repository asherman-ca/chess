require_relative 'slidable'
require_relative 'piece'

class Rook < Piece

  include Slidable

  def to_s
    color == :white ? " \u2656 " : " \u265C "
  end

  def move_dirs
    horizontal_dirs
  end

end
