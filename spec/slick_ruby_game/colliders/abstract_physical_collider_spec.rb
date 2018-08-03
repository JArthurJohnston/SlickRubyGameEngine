include Java
require_relative '../../../lib/slick_ruby_game/colliders/abstract_physical_collider'
require_relative '../../../lib/slick_ruby_game/include_slick'

java_import org.newdawn.slick.geom.Rectangle

describe 'Abstract Physical Collider' do

    before 'each' do
        @collider = SlickRubyGame::Colliders::AbstractPhysicalCollider.new
        @other_collider = SlickRubyGame::Colliders::AbstractCollider.new

        @game_object = double('game-object')
        allow(@game_object).to receive(:offset_x).and_return(55)
        allow(@game_object).to receive(:offset_y).and_return(66)

        allow(@game_object).to receive(:add_collider).with(@collider)

        @collider.offset_x = 5
        @collider.offset_y = 6
        @collider.parent= @game_object
    end

    describe '#init' do
        before 'each' do
            gc = double('game-container')
            @collider.init(gc)
        end

        it 'should get its parents last known position' do
            expect(@collider.last_known_x).to match 55
            expect(@collider.last_known_y).to match 66
        end
    end

    describe '#update' do
        before 'updating' do
            @collider.shape = Rectangle.new(3,2,5,3)

            @collider.update(nil, nil)
        end

        it 'should update its shapes position' do
            expect(@collider.shape.get_x).to match 60
            expect(@collider.shape.get_y).to match 72
        end

    end


    describe '#handle_collision' do
        before 'collision' do
            @collider.shape = Rectangle.new(3,2,5,3)
            @other_collider.shape = Rectangle.new(4,3,6,4)

            @collider.last_known_x = 33
            @collider.last_known_y = 44
        end
        
        it 'should reset its parents position on collision' do
            expect(@game_object).to receive(:offset_x=).with(33)
            expect(@game_object).to receive(:offset_y=).with(44)

            @collider.handle_collision_with(@other_collider)
        end
    end
    
end