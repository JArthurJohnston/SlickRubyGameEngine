include Java

java_import javax.swing.JMenuBar,
            javax.swing.JMenu,
            javax.swing.JMenuItem

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
                    return file_menu
                end
            end
        end
    end
end
