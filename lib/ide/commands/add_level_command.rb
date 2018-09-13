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

            class AddLevelCommand < AbstractCommand
                attr_reader :game, :level_name

                def execute(ide_state)
                    dialog = AddLevelDialog.new
                    dialog.set_ok_button_listener(AddLevelOkActionListener.new)
                    dialog.set_visible(true)
                end

            end
        end
    end
end

SlickRubyGame::IDE::Commands::AddLevelCommand.new.execute(nil)

