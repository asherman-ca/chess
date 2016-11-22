require_relative 'stepable'

class King < Piece

  def to_s
    " K "
  end

  def move_dirs
    king_steps
  end

end
