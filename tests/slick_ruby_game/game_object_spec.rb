require_relative '../../../lib/slick_ruby_game/game_object'

describe GameObject do

    describe :update do
        context 'with some sub game objects' do
            before 'calling update' do
                @sub_game_object = double()
                @game_object = GameObject.new
                @game_object.game_objects.push(@sub_game_object)
                @graphics_container = double()
                delta = 23432.2342

                @game_object.update(@graphics_container, delta)
            end

            it 'should update its sub game objects' do
                expect(1).to(eq(0))
            end

        end
    end

end