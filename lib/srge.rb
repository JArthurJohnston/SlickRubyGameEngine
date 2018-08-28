include Java

require_relative './srge/basic_game'

java_import org.newdawn.slick.AppGameContainer

module SRGE

    def self.start(game, is_fullscreen = false)
        game_container = AppGameContainer.new(game)
        game_container.set_display_mode(game.width, game.height, is_fullscreen)
        game_container.start
    end

end
