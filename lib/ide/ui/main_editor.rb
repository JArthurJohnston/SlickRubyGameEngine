include Java

require_relative '../../slick_ruby_game/include_slick'
require_relative '../../slick_ruby_game/main_game_loop'

java_import javax.swing.JFrame,
            javax.swing.JPanel,
            java.awt.BorderLayout,
            javax.swing.JTree,
            java.awt.Color,
            org.newdawn.slick.CanvasGameContainer,
            javax.swing.JMenuBar,
            javax.swing.JMenu,
            javax.swing.JMenuItem

module SlickRubyGame
    module IDE
        module UI
            class MainEditor < JFrame

                def initialize(ide)
                    super('SRGE IDE')
                    @ide = ide
                    self.set_size(1024, 768)
                    self.set_default_close_operation(JFrame::EXIT_ON_CLOSE)
                    self.init_main_panels
                    self.init_menu
                end
            
                def init_menu
                    menu_bar = JMenuBar.new
                    file_menu = JMenu.new('File')
                    add_level_item = JMenuItem.new('Add Level')
            
                    file_menu.add(add_level_item)
                    menu_bar.add(file_menu)
                    self.set_jmenu_bar(menu_bar)
                end
            
                def init_main_panels
                    @main_game_panel = CanvasGameContainer.new(@ide.game)
                    @main_game_panel.set_background(Color::BLACK)
                    game_heirarchy_tree = JTree.new
                    object_details_panel = JPanel.new
            
                    add(game_heirarchy_tree, BorderLayout::WEST)
                    add(@main_game_panel, BorderLayout::CENTER)
                    add(object_details_panel, BorderLayout::EAST)
                end
            
                def set_visible(is_visible)
                    super
                    @main_game_panel.start
                end
            
            end
        end
    end
end


