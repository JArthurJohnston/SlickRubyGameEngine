include Java

require_relative '../commands/add_level_command'

java_import javax.swing.JFrame,
            javax.swing.JLabel,
            javax.swing.JPanel,
            javax.swing.JButton,
            javax.swing.JTextField,
            java.awt.GridLayout,
            java.awt.FlowLayout

module SlickRubyGame
    module IDE
        module UI

            class AddLevelDialog < JFrame
                def initialize
                    super('Add Level')
                    set_size(400, 200)
                    set_layout(GridLayout.new(3, 0))
                    add(name_panel)
                    add(default_layer_name_panel)
                    add(button_panel)
                end

                def name_panel
                    panel = JPanel.new
                    panel.set_layout(FlowLayout.new)
                    label = JLabel.new('level Name:')
                    label.set_size(80, 20)
                    panel.add(label)
                    @level_name_field = JTextField.new('New Level')
                    panel.add(@level_name_field)
                    return panel
                end

                def default_layer_name_panel
                    panel = JPanel.new
                    panel.set_layout(FlowLayout.new)
                    panel.add(JLabel.new('Default Layer Name:'))
                    @default_layer_name_field = JTextField.new('Default')
                    panel.add(@default_layer_name_field)
                    return panel
                end

                def button_panel
                    panel = JPanel.new
                    panel.set_layout(FlowLayout.new)
                    panel.add(ok_button)
                    panel.add(cancel_button)
                    return panel
                end

                def ok_button
                    ok_button = JButton.new('OK')
                    return ok_button
                end

                def cancel_button
                    cancel_button = JButton.new('Cancel')
                    return cancel_button
                end

            end
            
        end
    end
end

dialog  = SlickRubyGame::IDE::UI::AddLevelDialog.new
dialog.set_visible(true)
