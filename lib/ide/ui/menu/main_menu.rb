include Java

require_relative '../../include_ui'
require_relative '../../commands/add_level_command'
require_relative '../../commands/block_action_listener'

java_import javax.swing.JMenuBar,
            javax.swing.JMenu,
            javax.swing.JMenuItem,
            javax.swing.AbstractAction,
            javax.swing.Action,
            java.awt.event.KeyEvent

module SlickRubyGame
    module IDE
        module UI
            class MainMenu < JMenuBar

                def initialize
                    super
                    add(file_menu)
                end

                def file_menu
                    file_menu = JMenu.new('File')
                    file_menu.add(add_level_menu_item)
                    return file_menu
                end

                def add_level_menu_item
                    item = JMenuItem.new('New Level')
                    listener = SlickRubyGame::IDE::Commands::BlockActionListener.on_action do
                        ide_state =  SlickRubyGame::IDE::State::IDEState.instance
                        processor = SlickRubyGame::IDE::State::IDEState.instance.command_processor
                        processor.handle(SlickRubyGame::IDE::Commands::AddLevelCommand.new)
                    end
                    item.add_action_listener(listener)
                    return item
                end
                
            end
        end
    end
end
