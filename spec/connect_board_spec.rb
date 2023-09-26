require_relative '../lib/connect_four_board.rb'

describe Board do

  subject(:board) { Board.new(players) }
  let(:players) { double('players') }

  describe '#initialize' do
    it 'creates array with 43 elements' do
      expect(Board.new.board.length).to eq(43)
    end
  end

  describe '#set_up_game' do
    it 'sends message to Players class' do
      allow(players).to receive(:get_player_names)
      allow(board).to receive(:display_board)
      allow(board).to receive(:create_current_player)
      expect(players).to receive(:get_player_names)
      board.set_up_game      
    end
  end

  describe '#create_current_player' do
    it 'sets current player to first player in players hash' do
      allow(players).to receive(:player_names).and_return({ 'Player1' => 'X', 'Player2' => 'O' })
      board.create_current_player  
      expect(board.instance_variable_get(:@current_player)).to eq('Player1')
    end
  end
  
  describe '#place_symbol' do    
    xit 'writes X to correct board position' do
      allow(players).to receive(:player_names).and_return('X')
      allow(board).to receive()
      board.place_symbol(1)
      board_arr = board.instance_variable_get(:@board)
      expect(board_arr[1]).to eq('X')
    end    
  end

  describe '#switch_player' do
    it 'set current player to second player in players hash' do
      allow(players).to receive(:player_names).and_return({ 'Player1' => 'X', 'Player2' => 'O' })
      board.create_current_player  
      board.switch_player
      expect(board.instance_variable_get(:@current_player)).to eq('Player2')
    end
  end
end

