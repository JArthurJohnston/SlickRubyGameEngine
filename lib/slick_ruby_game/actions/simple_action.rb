module SlickRubyGame
    module Actions
        
        class SimpleAction
            attr_reader :trigger_block
            
            def when_triggered(&block)
                @trigger_block = block
            end

            def trigger(game_container, delta)
                @trigger_block.call(game_container, delta)
            end

        end

    end
end