require 'json'
require_relative '../../srge/basic_game'

module SlickRubyGame
    module Serializing
        class Deserializer
            def game_object_from(json_string)
                game_object_map = JSON.parse(json_string)
                return Object.const_get(game_object_map['object_class']).new
            end
        end
    end
end
