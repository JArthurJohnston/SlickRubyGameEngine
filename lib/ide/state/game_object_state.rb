
module SlickRubyGame
    module IDE
        module State
            class GameObjectState
                attr_accessor :model, :parent

                def initialize(game_object)
                    @model = game_object
                end
            end
        end
    end
end
