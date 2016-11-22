require_relative 'stepable'

class Knight < Piece

  def to_s
    " K "
  end

  def move_dirs
    knight_hops
  end

end
