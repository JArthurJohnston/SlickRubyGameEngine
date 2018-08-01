require_relative '../../../lib/slick_ruby_game/input/input_handler'

AbstractInputHandler = SlickRubyGame::Input::AbstractInputHandler
InputType = SlickRubyGame::Input::InputType

class TestInputHandler < AbstractInputHandler
    attr_reader :graphics_container, :delta
    def handle_key_event(graphics_container, delta)
        @graphics_container = graphics_container
        @delta = delta
    end
end

describe AbstractInputHandler do
    
    context 'building with the when method' do
        before 'update' do
            @gc_passed_in = nil
            @delta_passed_in = nil
            @input_handler = TestInputHandler.new
            @input_handler.key_code = Input::KEY_ESCAPE
            @input_handler.input_type = InputType::PRESSED
        end
            
         it 'should have its fields' do
            expected_delta = 32424
            expected_gc = double('graphics_container')
            input_double = double('input')

            allow(expected_gc).to receive(:get_input).and_return(input_double)
            allow(input_double).to receive(:is_key_pressed).with(Input::KEY_ESCAPE).and_return(true)

            @input_handler.update(expected_gc, expected_delta)

            expect(@input_handler.graphics_container).to be expected_gc
            expect(@input_handler.delta).to be expected_delta
        end

    end

end
