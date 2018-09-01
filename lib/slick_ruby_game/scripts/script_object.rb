require_relative '../game_object'
require_relative 'game_script'

module SlickRubyGame
    module Scripts

        class ScriptObject < SlickRubyGame::GameObject
            attr_accessor :file_path, :module_name, :script, :variables

            def init(game_container)
                super
                load_script
                @script.init(game_container)
            end

            def load_script
                load(file_path)
                @script = Object.const_get(module_name).new
                unless variables.nil?
                    variables.each_key do
                        |each_var_name|
                        @script.instance_variable_set(each_var_name, variables[each_var_name])
                    end
                end
                @script.parent = parent
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
