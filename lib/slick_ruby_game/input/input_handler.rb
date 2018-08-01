include Java
java_import org.newdawn.slick.command.InputProviderListener,
            org.newdawn.slick.command.InputProvider,
            org.newdawn.slick.Input

require_relative '../game_object'

module SlickRubyGame
    module Input
        module InputType
            PRESSED = :PRESSED
            DOWN = :DOWN
        end

        class InputHandler < SlickRubyGame::GameObject

            def self.for(key_code)
                handler = self.new
                handler.key_code = key_code
                return handler
            end

            attr_accessor :key_code,
                            :input_type,
                            :update_block

            def update(graphics_container, delta)
                super
                input = graphics_container.get_input
                if(input_triggered?(input))
                    update_block.call(graphics_container, delta)
                end
            end

            def input_triggered?(input)
                if(input_type == InputType::PRESSED)
                    return input.is_key_pressed(key_code)
                elsif(input_type == InputType::DOWN)
                    return input.is_key_down(key_code)
                end
                return false
            end

            def on_key_pressed(&block)
                puts 'Block: ' + block.to_s
                self.input_type = InputType::PRESSED
                update_block = block
            end

            def on_key_down(&block)
                self.input_type = InputType::DOWN
                update_block = block
            end
        end
    end
end
