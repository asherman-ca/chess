require_relative 'stepable'
require_relative 'piece'

class Knight < Piece

  def to_s
    color == :white ? " \u2658 " : " \u265E "
  end

  def move_dirs
    knight_hops
  end

end
