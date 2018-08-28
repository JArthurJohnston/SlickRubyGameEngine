require 'json'

module SlickRubyGame
    module Serializing
        module Serializable

            def excluded_variables
                return [:@parent, :@game_objects]
            end

            def as_json
                return self.variable_map.to_json
            end

            def variable_map
                variables = {}
                variables[:object_class] = self.class.name
                self.instance_variables.each do
                    |each_var_name|
                    unless self.excluded_variables.include?(each_var_name)
                        variables[each_var_name] = self.instance_variable_get(each_var_name)
                    end
                end
                variables[:@game_objects] = game_objects_maps
                return variables
            end

            def game_objects_maps
                sub_object_json = []
                @game_objects.each do
                    |each_sub_object|
                    sub_object_json.push(each_sub_object.variable_map)
                end
                return sub_object_json
            end

        end
    end
end