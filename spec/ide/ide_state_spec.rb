require_relative '../../lib/ide/state/ide_state'

describe 'ide state' do

    before :each do
        @subject = SlickRubyGame::IDE::State::IDEState.new
    end

    it 'should create a default game' do
        game = @subject.game
        expect(game.identifier).to match 'New Game'
    end
    
end
