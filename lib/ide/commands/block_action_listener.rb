include Java
java_import java.awt.event.ActionListener

module SlickRubyGame
    module IDE
        module Commands
            class BlockActionListener
                include ActionListener

                def self.on_action(&block)
                    return self.new(block)
                end

                def initialize(block)
                    @block = block
                end

                def action_performed(event)
                    @block.call
                end
            end
        end
    end
end
