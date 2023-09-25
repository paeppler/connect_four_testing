require_relative 'connect_four_player.rb'

class Board
  attr_accessor :board
  def initialize(players = Players.new)
    @board = [' '] * 42
    @players = players
  end

  def play_game
    set_up_game

  end

  def set_up_game
    @players.get_player_names    
    display_board
    # play_turn
  end

  


  def display_board
    puts <<-HEREDOC

          1    2    3    4    5    6    7

        +----+----+----+----+----+----+----+
        | #{@board[35]}  | #{@board[36]}  | #{@board[37]}  | #{@board[38]}  | #{@board[39]}  | #{@board[40]}  | #{@board[41]}  |
        +----+----+----+----+----+----+----+
        | #{@board[28]}  | #{@board[29]}  | #{@board[30]}  | #{@board[31]}  | #{@board[32]}  | #{@board[33]}  | #{@board[34]}  |
        +----+----+----+----+----+----+----+  
        | #{@board[21]}  | #{@board[22]}  | #{@board[23]}  | #{@board[24]}  | #{@board[25]}  | #{@board[26]}  | #{@board[27]}  |
        +----+----+----+----+----+----+----+
        | #{@board[14]}  | #{@board[15]}  | #{@board[16]}  | #{@board[17]}  | #{@board[18]}  | #{@board[19]}  | #{@board[20]}  |
        +----+----+----+----+----+----+----+
        | #{@board[7]}  | #{@board[8]}  | #{@board[9]}  | #{@board[10]}  | #{@board[11]}  | #{@board[12]}  | #{@board[13]}  |
        +----+----+----+----+----+----+----+
        | #{@board[0]}  | #{@board[1]}  | #{@board[2]}  | #{@board[3]}  | #{@board[4]}  | #{@board[5]}  | #{@board[6]}  |
        +----+----+----+----+----+----+----+

          HEREDOC
  end
end

# board = Board.new
# board.play_game



  