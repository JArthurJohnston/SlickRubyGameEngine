include Java

require_relative './slick_ruby_game/game_object'
require_relative './slick_ruby_game/level'
require_relative './slick_ruby_game/main_game_loop'
require_relative './slick_ruby_game/picture'

java_import org.newdawn.slick.AppGameContainer

module SRGE

    def self.start(game, width = 1920, height = 1080, is_fullscreen = false)
        game_container = AppGameContainer.new(game)
        game_container.set_display_mode(width, height, is_fullscreen)
        game_container.start
    end

end
