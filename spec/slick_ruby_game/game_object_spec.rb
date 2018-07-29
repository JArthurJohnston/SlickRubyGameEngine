require_relative '../../lib/slick_ruby_game/game_object'

module SlickRubyGame

    describe GameObject do
        context 'with some sub game objects' do
            before 'using a game object' do
                @game_object = GameObject.new
                @sub_game_object1 = double('game-object-1')
                @sub_game_object2 = double('game-object-2')
                @graphics_container = double('graphics-container')
                @delta = 23432.2342
                @game_object.game_objects = [@sub_game_object1, @sub_game_object2]
            end

            describe '#update' do
                it 'should call update and post update' do
                    expect(@sub_game_object1).to receive(:update).with(@graphics_container, @delta)
                    expect(@sub_game_object1).to receive(:post_update).with(@graphics_container, @delta)

                    expect(@sub_game_object2).to receive(:update).with(@graphics_container, @delta)
                    expect(@sub_game_object2).to receive(:post_update).with(@graphics_container, @delta)

                    @game_object.update(@graphics_container, @delta)
                end
            end

            describe '#render' do
                it 'should call render on sub game objects' do
                    graphics = double('graphics')
                    expect(@sub_game_object1).to receive(:render).with(@graphics_container, graphics)
                    expect(@sub_game_object2).to receive(:render).with(@graphics_container, graphics)

                    @game_object.render(@graphics_container, graphics)
                end
            end

            describe '#init' do
                it 'should call init on sub game objects' do
                    expect(@sub_game_object1).to receive(:init).with(@graphics_container)
                    expect(@sub_game_object2).to receive(:init).with(@graphics_container)

                    @game_object.init(@graphics_container)
                end
            end
        end
    end
end
