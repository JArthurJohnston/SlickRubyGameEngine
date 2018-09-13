include Java

require_relative '../../include_ui'

java_import javax.swing.JMenuBar,
            javax.swing.JMenu,
            javax.swing.JMenuItem,
            javax.swing.AbstractAction,
            javax.swing.Action,
            java.awt.event.KeyEvent

module SlickRubyGame
    module IDE
        module UI
            class MenuAction < AbstractAction

                def initialize(name, description, accelerator_key, command)
                    super(name, nil)
                    @command = command
                    action.put_value(Action::SHORT_DESCRIPTION, description)
                    action.put_value(Action::MNEMONIC_KEY, accelerator_key)
                end

                def action_performed(event)
                    processor = SlickRubyGame::IDE::State::IDEState.instance.command_processor
                    processor.handle(@command)
                end

            end
            class MainMenu < JMenuBar

                def initialize
                    super
                    add(file_menu)
                end

                def file_menu
                    file_menu = JMenu.new('File')
                    return file_menu
                end

                def add_level_action
                    action = MenuAction.new('New Level', 'Add a new level to your game', KeyEvent::VK_L)
                    
                    return action
                end

            end
        end
    end
end
