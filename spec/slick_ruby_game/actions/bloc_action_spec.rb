require_relative '../../../lib/slick_ruby_game/actions/block_action'


describe SlickRubyGame::Actions::BlockAction do
    before 'each test' do
        @expected_gc = double('game-container')
        @expected_delta = 324243.342
        @gc_passed_in = nil
        @delta_passed_in = nil
        @block_action = SlickRubyGame::Actions::BlockAction.new
    end

    describe 'start block' do
        before 'start is called' do
            @block_action.when_started do
                |gc, delta|
                @gc_passed_in = gc
                @delta_passed_in = delta
            end

            @block_action.start(@expected_gc, @expected_delta)
        end

        it 'should have passed gc and delta to its block' do
            expect(@gc_passed_in).to be @expected_gc
            expect(@delta_passed_in).to be @expected_delta
        end

    end

    describe 'stop block' do
        before 'stop is called' do
            @block_action.when_stopped do
                |gc, delta|
                @gc_passed_in = gc
                @delta_passed_in = delta
            end

            @block_action.stop(@expected_gc, @expected_delta)
        end

        it 'should have passed gc and delta to its block' do
            expect(@gc_passed_in).to be @expected_gc
            expect(@delta_passed_in).to be @expected_delta
        end

    end

end