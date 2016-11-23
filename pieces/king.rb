require_relative 'stepable'
require_relative 'piece'

class King < Piece

  include Stepable

  def to_s
    color == :white ? " \u2654 " : " \u265A "
  end

  def move_dirs
    king_steps
  end

end
