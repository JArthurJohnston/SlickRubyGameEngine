require_relative '../../../lib/slick_ruby_game/input/input_handler'

InputHandler = SlickRubyGame::Input::InputHandler
InputType = SlickRubyGame::Input::InputType

describe InputHandler do
    
    context 'building with the when method' do
        before 'update' do
            @gc_passed_in = nil
            @delta_passed_in = nil
            @input_handler = InputHandler.for(Input::KEY_ESCAPE) 
            @input_handler.on_key_pressed do
                |gc, delta|
                @gc_passed_in = gc
                @delta_passed_in = delta
            end

            expect(@input_handler.key_code).to be Input::KEY_ESCAPE
            expect(@input_handler.input_type).to be InputType::PRESSED
        end
            

         it 'should have its fields' do
            expected_delta = 32424
            expected_gc = double('graphics_container')
            input_double = double('input')

            @input_handler.update(expected_gc, expected_delta)
            allow(expected_gc).to receive(:input).and_return(input_double)
            allow(input_double).to receive(:is_key_pressed).and_return(true)

            expect(@gc_passed_in).to be expected_gc
            expect(@delta_passed_in).to be expected_delta
        end
        

    end

end