class Piece

  def initi1alize(name, board)
    @name = name
    @board = board
  end

  def to_s
    " "
  end

  def moves
    #duck typing
  end

  def empty?
  end

  def valid_moves(pos)
  end

  private

  def move_into_check(to_pos)
  end

end




# class King < Piece
# end
#
# class Knight < Piece
# end
#
# class Pawn < Piece
#
#   def initialize
#   end
#
#   def moves
#
#   end
#
#
# end
#
# class Queen < Piece
#   include SlidingPiece
#
# end
#
# class Rook < Piece
# end
#
# class Queen < Piece
# end

module SlidingPiece
  def moves(current_pos)
    move_arr = move_diffs(current_pos)
    move_arr.select do |move|
      valid_pos?(move)
    end
  end

  private

  def valid_pos?(move)

    if move.include?(0)

      zero_idx = move.find_index(0)
      diff_idx = zero_idx == 0 ? 1 : 0

      1.upto(move[diff_idx]) do |i|
        check_pos = @current_pos
        check_pos[diff_idx] += i

        return false if @board[check_pos].is_a?(NullPiece)
      end

    else



    end
  end

  def move_diffs(diff)
  end
end


module SteppingPiece

end
