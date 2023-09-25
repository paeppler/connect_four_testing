require_relative '../lib/connect_four_board.rb'

describe Board do

  subject(:board) { Board.new(players) }
  let(:players) { double('players') }

  describe '#initialize' do
    it 'creates array with 42 elements' do
      expect(Board.new.board.length).to eq(42)
    end
  end

  describe '#set_up_game' do
    it 'sends message to Players class' do
      allow(players).to receive(:get_player_names)
      expect(players).to receive(:get_player_names)
      allow(board).to receive(:display_board)
      board.set_up_game
    end
  end

  describe '#play_turn' do
    it 'writes X to correct board position' do
      expect(@board[0]).to eq('X')
      board.play_turn
    end
  end



end