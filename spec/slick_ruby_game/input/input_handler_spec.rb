require_relative '../../../lib/slick_ruby_game/input/input_handler'

AbstractInputHandler = SlickRubyGame::Input::AbstractInputHandler
InputType = SlickRubyGame::Input::InputType

class TestInputHandler < AbstractInputHandler
    attr_reader :graphics_container, 
    :delta, 
    :event_triggered_called, 
    :event_not_triggered_called

    def initialize
        super
        @event_triggered_called = false
        @event_not_triggered_called = false
    end

    def event_triggered(graphics_container, delta)
        @event_triggered_called = true
        @graphics_container = graphics_container
        @delta = delta
    end

    def event_not_triggered(graphics_container, delta)
        @event_not_triggered_called = true
        @graphics_container = graphics_container
        @delta = delta
    end
end

describe AbstractInputHandler do

    before 'each' do
        @expected_delta = 32424
        @expected_gc = double('graphics_container')
        @input_double = double('input')
    end
    
    context 'update with the correct input' do
        before 'update' do
            @gc_passed_in = nil
            @delta_passed_in = nil
            @input_handler = TestInputHandler.new
            @input_handler.key_code = Input::KEY_ESCAPE
            @input_handler.input_type = InputType::PRESSED
        end
            
         it 'should call event triggered' do
            allow(@expected_gc).to receive(:get_input).and_return(@input_double)
            allow(@input_double).to receive(:is_key_pressed).with(Input::KEY_ESCAPE).and_return(true)

            @input_handler.update(@expected_gc, @expected_delta)

            expect(@input_handler.graphics_container).to be @expected_gc
            expect(@input_handler.delta).to be @expected_delta
            expect(@input_handler.event_triggered_called).to be true
            expect(@input_handler.event_not_triggered_called).to be false
        end

        it 'should call event not triggered' do
            allow(@expected_gc).to receive(:get_input).and_return(@input_double)
            allow(@input_double).to receive(:is_key_pressed).with(anything()).and_return(false)

            @input_handler.update(@expected_gc, @expected_delta)

            expect(@input_handler.graphics_container).to be @expected_gc
            expect(@input_handler.delta).to be @expected_delta
            expect(@input_handler.event_triggered_called).to be false
            expect(@input_handler.event_not_triggered_called).to be true
        end

    end

end
