class Players
  attr_accessor :player_names

  def initialize
    @player_names = {}
  end

  def get_player_names
    puts "Player 1, enter your name:"
    player1_name = gets.chomp
    puts "Player 2, enter your name:"
    player2_name = gets.chomp
    @player_names = { player1_name => 'X', player2_name => 'O'}
    puts "\n#{player1_name} will be X and #{player2_name} will be O"
  end
end