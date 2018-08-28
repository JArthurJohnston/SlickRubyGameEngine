require 'json'
require_relative '../../srge/basic_game'
require_relative '../../srge/colliders'
require_relative '../../srge/input'
require_relative '../../srge/sprites'

module SlickRubyGame
    module Serializing

        class Deserializer
            def game_object_from(json_string)
                game_object_map = JSON.parse(json_string)
                return instantiate_from_map(game_object_map)
            end

            def instantiate_from_map(map)
                new_game_object =  Object.const_get(map['object_class']).new
                new_game_object.instance_variables.each do
                    |each_variable|
                    unless each_variable == :@game_objects
                        var_value = map[each_variable.to_s]
                        new_game_object.instance_variable_set(each_variable, var_value)
                    end
                end
                sub_game_objects = instantiate_sub_game_objects_from(map)
                new_game_object.game_objects = sub_game_objects
                return new_game_object
            end

            def instantiate_sub_game_objects_from(map)
                sub_game_objects = []
                map['@game_objects'].each do
                    |each_sub_object_map|
                    sub_game_objects.push(instantiate_from_map(each_sub_object_map))
                end
                return sub_game_objects
            end
        end

    end
end
