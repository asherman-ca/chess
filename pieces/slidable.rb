module Slidable
  HORIZONTAL_DIRS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ].freeze

  DIAGONAL_DIRS = [
    [1, 1],
    [-1, -1],
    [-1, 1],
    [1, -1]
  ].freeze

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []

    move_dirs.each do |dx, dy|
      moves += build_moves(dx, dy)
    end

    moves
  end

  def build_moves(dx, dy)

    moves = []
    current_x, current_y = pos

    while true
      current_x += dy
      current_y += dx
      current_move = [current_x, current_y]

      break if @board.valid_move?(current_move) == false

      if @board[current_move].color == self.color
        break
      elsif @board[current_move].color == !self.color
        moves << current_move
        break
      else
        moves << current_move
      end

    end

    moves
  end

end
