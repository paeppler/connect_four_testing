require_relative 'connect_four_player.rb'

class Board
  attr_accessor :board
  def initialize(players = Players.new)
    @board = [' '] * 43
    @players = players
    @current_player
  end

  def play_game
    set_up_game
    loop do
      play_turn
      if check_for_win
        puts "Game over! #{@current_player} wins!"
        break
      elsif (36..42).any? { |i| @board[i] == ' ' }
        switch_player
        next
      else
        puts "Game over! It's a draw!"
        break
      end
    end
  end

  def set_up_game
    @players.get_player_names    
    display_board
    create_current_player
  end 

  def display_board
    puts <<-HEREDOC

          1    2    3    4    5    6    7

        +----+----+----+----+----+----+----+
        |  #{@board[36]} |  #{@board[37]} |  #{@board[38]} |  #{@board[39]} |  #{@board[40]} |  #{@board[41]} | #{@board[42]}  |
        +----+----+----+----+----+----+----+
        |  #{@board[29]} |  #{@board[30]} |  #{@board[31]} |  #{@board[32]} |  #{@board[33]} |  #{@board[34]} | #{@board[35]}  |
        +----+----+----+----+----+----+----+  
        |  #{@board[22]} |  #{@board[23]} |  #{@board[24]} |  #{@board[25]} |  #{@board[26]} |  #{@board[27]} | #{@board[28]}  |
        +----+----+----+----+----+----+----+
        |  #{@board[15]} |  #{@board[16]} |  #{@board[17]} |  #{@board[18]} |  #{@board[19]} |  #{@board[20]} | #{@board[21]}  |
        +----+----+----+----+----+----+----+
        |  #{@board[8]} |  #{@board[9]} |  #{@board[10]} |  #{@board[11]} |  #{@board[12]} |  #{@board[13]} | #{@board[14]}  |
        +----+----+----+----+----+----+----+
        |  #{@board[1]} |  #{@board[2]} |  #{@board[3]} |  #{@board[4]} |  #{@board[5]} |  #{@board[6]} | #{@board[7]}  |
        +----+----+----+----+----+----+----+

          HEREDOC
  end

  def create_current_player
    @current_player = @players.player_names.keys.first
  end

  def play_turn
    loop do
      column = get_column
      verify_column(column) ? (place_symbol(column); break) : puts("That is not a valid column number, please try again")
    end
    display_board
  end

  def get_column
    puts "#{@current_player}, enter a column number to place your piece:"
    gets.chomp.to_i
  end

  def verify_column(column)
    column >= 1 && column <= 7 && @board[column + 35] == ' '
  end

  def place_symbol(column)
    (0..7).each do |i|
      if @board[(i * 7) + column] == ' '
        bb = @players.player_names[@current_player]
        @board[(i * 7) + column]  = bb
        break
      end
    end
  end

  def switch_player
    @current_player == @players.player_names.keys.first ? @current_player = @players.player_names.keys.last : @current_player = @players.player_names.keys.first
  end

  def check_for_win
    symbol = @players.player_names[@current_player]
    (1..43).each do |i|
      if @board[i] == symbol && @board[i + 1] == symbol && @board[i + 2] == symbol && @board[i + 3] == symbol
        return true
      elsif @board[i] == symbol && @board[i + 7] == symbol && @board[i + 14] == symbol && @board[i + 21] == symbol
        return true
      elsif @board[i] == symbol && @board[i + 8] == symbol && @board[i + 16] == symbol && @board[i + 24] == symbol
        return true
      elsif @board[i] == symbol && @board[i + 6] == symbol && @board[i + 12] == symbol && @board[i + 18] == symbol
        return true
      elsif i == 43
        return false
      else
        next
      end
    end
  end
end





  