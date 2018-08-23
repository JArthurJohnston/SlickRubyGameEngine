include Java

java_import javax.swing.JTree,
            javax.swing.tree.DefaultMutableTreeNode

module SlickRubyGame
    module IDE
        module UI

            class GameObjectNode < DefaultMutableTreeNode
                attr_accessor :model

                def initialize(game_object)
                    super(game_object.identifier)
                    @model = game_object
                end
            end

            class GameTree < JTree

                def initialize(game)
                    @root = GameObjectNode.new(game)
                    add_nodes_for(@root, game.game_objects)
                    super(@root)
                end
            
                def add_nodes_for(root, game_objects)
                    if(game_objects.empty?)
                        return
                    end
                    game_objects.each do
                        |game_object|
                        game_object_node = GameObjectNode.new(game_object)
                        root.add(game_object_node)
                        add_nodes_for(game_object_node, game_object.game_objects)
                    end
                end
            end
        end
    end
end

