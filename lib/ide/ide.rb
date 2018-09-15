require_relative './state/ide_state'

module SlickRubyGame
    module IDE
        def self.start
            editor = SlickRubyGame::IDE::UI::MainEditor.new(State::IDEState.instance)
            editor.set_visible(true)
        end
    end
end
