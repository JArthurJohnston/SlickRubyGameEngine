require_relative 'abstract_command'
require_relative '../../slick_ruby_game/level'

module SlickRubyGame
    module IDE
        module Commands
            class AddLevelCommand < AbstractCommand
                attr_reader :game, :level_name

                def initialize(game, level_name)
                    @game = game
                    @level_name = level_name
                end

                def execute
                    level = SlickRubyGame::Level.new
                    level.identifier = @level_name
                    @game.add_level(level)
                end
            end
        end
    end
end