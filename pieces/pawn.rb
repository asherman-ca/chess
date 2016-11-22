class Pawn < Piece

  STEPS_BLK = [
    [0, 2],
    [0, 1],
    [1, 1],
    [-1, 1]
  ].freeze

  STEPS_WHT = [
    [0, -2],
    [0, -1],
    [-1, -1],
    [1, -1]
  ].freeze

  def moves
    moves = []

    if color == :black
      moves += black_moves
    else
      moves += white_moves
    end

    moves
  end

  def black_moves
    moves = []

    current_x, current_y = pos

    STEPS_BLK.each do |dx, dy|
      current_x += dx
      current_y += dy
      current_move = [current_x, current_y]
      next if board.valid_move?(current_move)
      if dy == 2
        if pos[1] == 6 && board[current_move].empty?
          moves << current_move
        end
      elsif dx != 0
        if board[current_move].color != color && !board[current_move].empty?
          moves << current_move
        end
      else
        moves << current_move if board[current_move].empty?
      end

    end
    moves
  end

  def white_moves
    moves = []

    current_x, current_y = pos

    STEPS_WHT.each do |dx, dy|
      current_x += dx
      current_y += dy
      current_move = [current_x, current_y]
      next if board.valid_move?(current_move)
      if dy == 2
        if pos[1] == 1 && board[current_move].empty?
          moves << current_move
        end
      elsif dx != 0
        if board[current_move].color != color && !board[current_move].empty?
          moves << current_move
        end
      else
        moves << current_move if board[current_move].empty?
      end

    end
    moves
  end

end
