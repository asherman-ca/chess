require_relative 'piece'

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


    STEPS_BLK.each do |dx, dy|
      current_x, current_y = pos
      current_move = [current_x + dy, current_y + dx]

      next unless @board.valid_move?(current_move)
      if dy == 2
        if pos[0] == 1 && @board[current_move].empty?
          moves << current_move
        end
      elsif dx != 0
        if @board[current_move].color != color && !@board[current_move].empty?
          moves << current_move
        end
      else
        moves << current_move if @board[current_move].empty?
      end

    end
    moves
  end

  def white_moves
    moves = []

    # debugger

    STEPS_WHT.each do |dx, dy|
      current_x, current_y = pos
      current_move = [current_x + dy, current_y + dx]

      next unless @board.valid_move?(current_move)
      if dy == -2
        if pos[0] == 6 && @board[current_move].empty?
          moves << current_move
        end
      elsif dx != 0
        if @board[current_move].color != color && !@board[current_move].empty?
          moves << current_move
        end
      else
        moves << current_move if @board[current_move].empty?
      end

    end
    moves
  end

  def to_s
    color == :white ? " \u2659 " : " \u265F "
  end

end
