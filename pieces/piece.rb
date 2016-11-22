class Piece

  attr_reader :pos

  def initi1alize(board,pos)
    @board = board
    @pos = pos
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
class Queen < Piece

end

class Rook < Piece

  def initialize

  end

  def move_diffs(start_pos)
    all_moves = []

      (1..7).each do |i|
        move_diff = start_pos
        move_diff[0] += i

        unless @board[move_diff].is_a?(NullPiece)
          all_moves << start_pos if @board[move_diff].color != @color
          break
        end

        all_moves << start_pos
      end

      (1..7).each do |i|
        move_diff = start_pos
        move_diff[1] += i

        unless @board[move_diff].is_a?(NullPiece)
          all_moves << start_pos if @board[move_diff].color != @color
          break
        end

        all_moves << start_pos
      end

      (1..7).each do |i|
        move_diff = start_pos
        move_diff[0] -= i

        unless @board[move_diff].is_a?(NullPiece)
          all_moves << start_pos if @board[move_diff].color != @color
          break
        end

        all_moves << start_pos
      end

      (1..7).each do |i|
        move_diff = start_pos
        move_diff[1] -= i

        unless @board[move_diff].is_a?(NullPiece)
          all_moves << start_pos if @board[move_diff].color != @color
          break
        end

        all_moves << start_pos
      end

    end
  end

end

class Bishop < Piece

  def initialize

  end

  def move_diffs

  end

end

module SlidingPiece
  def moves(current_pos)
    move_arr = move_diffs(current_pos)
    move_arr.select do |move|
      valid_move?(move)
    end
  end

  private

  def valid_move?(move)

    if move.include?(0)

      zero_idx = move.find_index(0)
      diff_idx = zero_idx == 0 ? 1 : 0

      1.upto(move[diff_idx]) do |i|
        check_pos = @current_pos
        check_pos[diff_idx] += i

        return false if @board[check_pos].is_a?(NullPiece)
      end

    else
      diff = move[0].abs

      1.upto(diff) do |d|
        check_pos = @current_pos
        check_pos[0] = move[0] > 0 ? check_pos[0] + d : check_pos[0] - d
        check_pos[1] = move[1] > 0 ? check_pos[1] + d : check_pos[1] - d

        return false if @board[check_pos].is_a?(NullPiece)
      end
    end

    true
  end

  def move_diffs(diff)
  end
end


module SteppingPiece

end
