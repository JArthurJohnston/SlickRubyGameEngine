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
            allow(@mock_level).to receive(:identifier).and_return('level_one')
            expect(@mock_level).to receive(:init).with(@game_container)

            @main_game.add_level(@mock_level)
            
            @main_game.init(@game_container)
        end

        describe '#retrieve_level' do
            it 'should return a level with its identifier' do
                expect(@main_game.retrieve_level('level_one')).to be @mock_level
            end
        end

        describe '#init' do
            it 'should set its first level as its current level' do
                expect(@main_game.current_level).to be(@mock_level)
            end

            it 'should save the game container' do
                expect(@main_game.game_container).to be @game_container
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

    context 'adding levels' do
        before :each do
            @main_game = SlickRubyGame::MainGameLoop.new('hello')
            @level_one = double('level1')
            @level_two = double('level2')

            allow(@level_one).to receive(:parent=).with(@main_game)
            allow(@level_one).to receive(:identifier).and_return('level_one')

            allow(@level_two).to receive(:parent=).with(@main_game)
            allow(@level_two).to receive(:identifier).and_return('level_two')
        end

        it 'should start with a nil current level' do
            expect(@main_game.current_level).to be_nil
        end

        it 'should set the added level to the current level' do
            @main_game.add_level(@level_one)

            expect(@main_game.current_level).to be @level_one

            @main_game.add_level(@level_two)

            expect(@main_game.current_level).to be @level_one
            expect(@main_game.retrieve_level('level_two')).to be @level_two
        end

        it 'should throw an error if level identifier already exists' do
            @main_game.add_level(@level_one)
            expect {
                @main_game.add_level(@level_one)
            }.to raise_error(RuntimeError)
        end

        describe '#retrieve_level' do
            before 'retrieval' do
                @main_game.add_level(@level_one)
            end

            it 'should return the level with the right id' do
                level = @main_game.retrieve_level('level_one')

                expect(level).to be @level_one
            end
            
        end
    end

    context 'transitioning levels' do
        before :each do
            @main_game = SlickRubyGame::MainGameLoop.new('hello')
            @level_one = double('level1')
            @level_two = double('level2')

            allow(@level_one).to receive(:close)
            allow(@level_one).to receive(:parent=).with(@main_game)
            allow(@level_one).to receive(:identifier).and_return('level_one')

            allow(@level_two).to receive(:init)
            allow(@level_two).to receive(:parent=).with(@main_game)
            allow(@level_two).to receive(:identifier).and_return('level_two')

            @main_game.add_level(@level_one)
            @main_game.add_level(@level_two)
        end

        it 'should set the current level to the new level' do
            @main_game.transition_to('level_two')

            expect(@main_game.current_level).to be @level_two
        end

        it 'should throw an error if the level does not exist' do
            expect {
                @main_game.transition_to('sdlkjdfldsfjfs')
            }.to raise_error RuntimeError
        end
    end


end
