
class LevelLoader < SlickRubyGame::Scripts::GameScript
    attr_accessor :level_name

    def load_level
        SlickRubyGame::MainGameLoop.instance.transition_to(@level_name)
    end

end
