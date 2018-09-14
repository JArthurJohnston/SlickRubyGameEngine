include Java

require_relative '../include_ui'

java_import com.paratussoftware.srge.dialogs.newLevel.AddLevelDialog,
            java.awt.event.ActionListener

require_relative 'abstract_command'
require_relative 'block_action_listener'
require_relative '../../slick_ruby_game/level'
require_relative '../../slick_ruby_game/picture'

module SlickRubyGame
    module IDE
        module Commands

            class AddLevelCommand < AbstractCommand
                attr_reader :game, :level_name

                def execute(ide_state)
                    dialog = AddLevelDialog.new
                    listener = BlockActionListener.on_action do
                        model = dialog.get_model
                        new_level = SlickRubyGame::Level.new
                        new_level.identifier = model.get_name
                        new_level.current_layer.identifier= model.get_default_layer_name
                        unless(model.get_background_location_name.empty?)
                            background = SlickRubyGame::Picture.new
                            background.image_location = model.get_background_location_name
                            new_level.add_game_object(background)
                        end

                        ide_state.game.add_level(new_level)
                        dialog.set_visible(false)
                        dialog.dispose()
                    end
                    dialog.set_ok_button_listener(listener)
                    dialog.set_visible(true)
                end

            end

        end
    end
end
