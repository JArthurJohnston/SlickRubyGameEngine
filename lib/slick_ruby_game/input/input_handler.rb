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

        class AbstractInputHandler < SlickRubyGame::GameObject
            attr_accessor :key_code,
                          :input_type

            def update(graphics_container, delta)
                super
                input = graphics_container.get_input
                if(input_triggered?(input))
                    event_triggered(graphics_container, delta)
                else
                    event_not_triggered(graphics_container, delta)
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

            def event_triggered(graphics_container, delta)
                # Meant to be overridden
            end

            def event_not_triggered(graphics_container, delta)
                # Meant to be overridden
            end
        end
    end
end
