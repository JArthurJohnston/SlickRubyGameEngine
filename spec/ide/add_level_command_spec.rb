require_relative '../../lib/ide/commands/add_level_command'


AddLevelCommand = SlickRubyGame::IDE::Commands::AddLevelCommand

describe AddLevelCommand do

    before :each do
        @game = double('game')
        @expected_level_name = 'new level'
        @subject = AddLevelCommand.new(@game, @expected_level_name)
    end

    describe '#execute' do

        before 'executing' do
            @level = nil
            expect(@game).to receive(:add_level) {|level| @level = level}

            @subject.execute
        end

        it 'should create a level' do
            expect(@level).to be_instance_of(SlickRubyGame::Level)
        end

        it 'should set the levels identifier' do
            expect(@level.identifier).to match @expected_level_name
        end
    end
end
