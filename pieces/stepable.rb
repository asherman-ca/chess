module Stepable
  KNIGHT_HOPS = [
    [-1, -2],
    [1, -2],
    [2, -1],
    [2, 1],
    [-1, 2],
    [1, 2],
    [-2, -1],
    [-2, 1]
  ].freeze

  KING_STEPS = [
    [-1, 0],
    [-1, 1],
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1]
  ].freeze

  def king_steps
    KING_STEPS
  end

  def knight_hops
    KNIGHT_HOPS
  end

  def moves
    moves = []

    move_dirs.each do |dx, dy|
      current_x, current_y = pos

      current_x += dy
      current_y += dx

      current_move = [current_x, current_y]

      if @board.valid_move?(current_move)
        if @board[current_move].empty?
          moves << current_move
        elsif @board[current_move].color != self.color
          moves << current_move
        end
      end

    end

    moves
  end

end
