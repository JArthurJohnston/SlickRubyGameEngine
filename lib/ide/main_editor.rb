include Java

java_import javax.swing.JFrame,
            javax.swing.JPanel,
            java.awt.BorderLayout,
            javax.swing.JTree,
            java.awt.Color


class MainEditor < JFrame
    def initialize()
        super('SRGE IDE')
        self.set_size(1024, 768)
        self.set_default_close_operation(JFrame::EXIT_ON_CLOSE)
        self.init_main_panels
    end

    def init_main_panels
        main_game_panel = JPanel.new
        main_game_panel.set_background(Color::BLACK)
        game_heirarchy_tree = JTree.new
        object_details_panel = JPanel.new

        add(game_heirarchy_tree, BorderLayout::WEST)
        add(main_game_panel, BorderLayout::CENTER)
        add(object_details_panel, BorderLayout::EAST)
    end
        

end