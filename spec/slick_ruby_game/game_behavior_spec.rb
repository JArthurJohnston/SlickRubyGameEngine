require_relative '../../lib/slick_ruby_game/game_behavior'

class TestGameBehavior
    include SlickRubyGame::GameBehavior
end

describe SlickRubyGame::GameBehavior do

    before 'each' do
        @behavior = TestGameBehavior.new
    end

    describe 'default values' do

        it 'should have default offsets' do
            expect(@behavior.offset_x).to be 0
            expect(@behavior.offset_y).to be 0
        end
        
        it 'shouldnt have a parent' do
            expect(@behavior.parent).to be nil
        end

        it 'should have an empty list of game objects' do
            expect(@behavior.game_objects).to be_empty
        end
    end

    describe '#identifier' do
        it 'should have its class name as its default identifier' do
            expect(@behavior.identifier).to match 'TestGameBehavior'
        end

        it 'should be able to accept another identifier' do
            expected_id = 'something-esle'

            @behavior.identifier= expected_id

            expect(@behavior.identifier).to be expected_id
        end
    end

end
