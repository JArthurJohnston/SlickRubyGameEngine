require_relative './commands/command_processor'
require_relative '../slick_ruby_game/main_game_loop'
require_relative './ui/main_editor'


module SlickRubyGame
    module IDE
        class IDEState
            attr_accessor :game, 
                        :selected_game_object, 
                        :command_processor
            @@instance = self.new
    
            def initialize
                @game = build_default_game
                @selected_game_object = @game
                @command_processor = CommandProcessor.new(self)
            end
    
            def build_default_game
                game = SlickRubyGame::MainGameLoop.new
                game.identifier = 'New Game'
                return game
            end
    
            def self.start
                editor = SlickRubyGame::IDE::UI::MainEditor.new(@@instance)
                editor.set_visible(true)
            end
    
            def self.instance
                return @@instance
            end
        end

        def self.start
            editor = SlickRubyGame::IDE::UI::MainEditor.new(IDEState.instance)
            editor.set_visible(true)
        end
    end
end
