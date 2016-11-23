require_relative 'board'
require_relative 'player'
require_relative 'display'


class Chess

  def initialize(name1, name2)
    @player1 = Player.new(name1, :white)
    @player2 = Player.new(name2, :black)
    @board = Board.new
    @display = Display.new(@board)
    @current_player = :white
  end


  def play

    until won?
      take_turn
      @display.cursor.reset
      switch_player
    end

  end

  def switch_player
    @current_player = @current_player == :white ? :black : :white
  end

  def take_turn
    cursor_input = nil

    until cursor_input == :space
      @display.render
      cursor_input = @display.cursor.get_input

      if @board[@display.cursor.cursor_pos].color != @current_player
        cursor_input = nil
        @display.cursor.reset
      end
    end

    first_turn = @display.cursor.cursor_pos
    cursor_input = nil

    until cursor_input == :space
      @display.render
      cursor_input = @display.cursor.get_input
    end

    second_turn = @display.cursor.cursor_pos


    @board.move_piece(first_turn, second_turn)
  end

  def won?
    nil
  end

end

chess = Chess.new("bob", "shirley")
chess.play
