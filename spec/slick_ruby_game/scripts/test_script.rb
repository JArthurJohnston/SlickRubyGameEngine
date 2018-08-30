
class TestScript < SlickRubyGame::Scripts::GameScript
    attr_accessor :init_called, :update_called, :render_called,
                :game_container, :graphics, :delta

    def initialize
        @init_called=false
        @render_called=false
        @update_called=false
    end

    def test_method
        return 'test value'
    end

    def init(game_container)
        @game_container = game_container
        @init_called = true
    end

    def update(game_container, delta)
        @game_container = game_container
        @delta = delta
        @update_called = true
    end

    def render(game_container, graphics)
        @game_container = game_container
        @graphics = graphics
        @render_called = true
    end

end