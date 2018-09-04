require_relative '../game_object'
require_relative 'game_script'

module SlickRubyGame
    module Scripts

        class ScriptObject < SlickRubyGame::GameObject
            attr_accessor :file_path, :module_name, :variables

            def init(game_container)
                super
                @script.init(game_container)
            end

            def script
                if(@script.nil?)
                    load_script
                end
                return @script
            end

            def load_script
                load(file_path)
                @script = Object.const_get(module_name).new
                if(@script.nil?)
                    raise 'Script could not be loaded from: ' + file_path
                end
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
