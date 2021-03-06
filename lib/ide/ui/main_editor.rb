include Java

require_relative './menu/main_menu'
require_relative '../../slick_ruby_game/include_slick'
require_relative '../../slick_ruby_game/main_game_loop'
require_relative 'game_tree_panel'

java_import javax.swing.JFrame,
            javax.swing.JPanel,
            java.awt.BorderLayout,
            javax.swing.JTree,
            java.awt.Color,
            org.newdawn.slick.CanvasGameContainer,
            javax.swing.JMenuBar,
            javax.swing.JMenu,
            javax.swing.JMenuItem,
            javax.swing.JScrollPane,
            java.awt.Dimension

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

                def add_scrollable(component, layout_position)
                    add(JScrollPane.new(component), layout_position)
                end
            
                def init_menu
                    menu_bar = MainMenu.new
                    self.set_jmenu_bar(menu_bar)
                end
            
                def init_main_panels
                    object_details_panel = JPanel.new
                    bottom_panel = JPanel.new
                    @main_game_panel = CanvasGameContainer.new(@ide.game)
                    add(build_game_tree_panel, BorderLayout::WEST)
                    add(@main_game_panel, BorderLayout::CENTER)
                    add(object_details_panel, BorderLayout::EAST)
                    add(bottom_panel, BorderLayout::SOUTH)
                end

                def build_game_tree_panel
                    scroll_pane = JScrollPane.new(GameTree.new(@ide.game))
                    scroll_pane.set_preferred_size(Dimension.new(100, 768))
                    return scroll_pane
                end
            
                def set_visible(is_visible)
                    super
                    @main_game_panel.start
                end
            
            end
        end
    end
end


