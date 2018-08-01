

module SlickRubyGame
    module Actions
        
        class BlockAction
            attr_reader :start_block,
                        :stop_block
            def when_started(&block)
                @start_block = block
            end

            def when_stopped(&block)
                @stop_block = block
            end

            def start(game_container, delta)
                @start_block.call(game_container, delta)
            end

            def stop(game_container, delta)
                @stop_block.call(game_container, delta)
            end
        end

    end
end