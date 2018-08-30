require_relative '../game_object'
require_relative 'game_script'

module SlickRubyGame
    module Scripts

        class ScriptObject < SlickRubyGame::GameObject
            attr_accessor :file_path, :module_name, :script

            def init(game_container)
                super
                load(file_path)
                @script = Object.const_get(module_name).new
                @script.init(game_container)
            end

            def update(game_container, delta)
                super
                @script.update(game_container, delta)
            end

            def render(game_container, graphics)
                super
                @script.render(game_container, graphics)
            end
            
        end

    end
end
