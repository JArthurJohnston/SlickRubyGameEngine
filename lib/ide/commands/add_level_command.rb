include Java

require_relative '../include_ui'

java_import com.paratussoftware.srge.dialogs.newLevel.AddLevelDialog,
            java.awt.event.ActionListener


require_relative 'abstract_command'
require_relative '../../slick_ruby_game/level'

module SlickRubyGame
    module IDE
        module Commands
            class AddLevelOkActionListener 
                include ActionListener

                def action_performed(event)
                    puts 'ok clicked'
                end
            end

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

            class AddLevelCommand < AbstractCommand
                attr_reader :game, :level_name

                def execute(ide_state)
                    dialog = AddLevelDialog.new
                    listener = BlockActionListener.on_action do
                        model = dialog.get_model
                        puts 'called: ' + model.get_name + ' ' + model.get_default_layer_name
                    end
                    dialog.set_ok_button_listener(listener)
                    dialog.set_visible(true)
                end

            end
        end
    end
end

SlickRubyGame::IDE::Commands::AddLevelCommand.new.execute(nil)
