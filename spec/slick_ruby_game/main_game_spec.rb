require_relative '../../lib/slick_ruby_game/main_game_loop'

describe SlickRubyGame::MainGameLoop do

    describe '#initialize' do
        before :each do
            @main_game = SlickRubyGame::MainGameLoop.new('Hello')
        end

        it 'should have an empty list of levels' do
            expect(@main_game.levels).to be_empty
        end

        it 'should have the identifier passed to it' do
            expect(@main_game.identifier).to match 'Hello'
        end
    end

    context '#current_level' do
        before :each do
            @main_game = SlickRubyGame::MainGameLoop.new('hello')
            @game_container = double('gc')
            @mock_level = double('level')

            allow(@mock_level).to receive(:parent=).with(@main_game)
            expect(@mock_level).to receive(:init).with(@game_container)
            @main_game.add_level(@mock_level)
            
            @main_game.init(@game_container)
        end

        describe '#init' do
            it 'should set its first level as its current level' do
                expect(@main_game.current_level).to be(@mock_level)
            end
        end

        describe '#render' do
            it 'should call render on current level' do
                graphics = double('graphics')
                expect(@mock_level).to receive(:render).with(@game_container, graphics)

                @main_game.render(@game_container, graphics)
            end
        end

        describe '#update' do
            it 'should call update on current level' do
                delta = 43.234
                expect(@mock_level).to receive(:update).with(@game_container, delta)

                @main_game.update(@game_container, delta)
            end
        end
    end
end
