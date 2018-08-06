include Java
require_relative '../../../lib/slick_ruby_game/include_slick'
require_relative '../../../lib/slick_ruby_game/colliders/abstract_collider'

java_import org.newdawn.slick.geom.Rectangle

AbstractCollider = SlickRubyGame::Colliders::AbstractCollider

describe AbstractCollider do

    before :each do
        @abstract_collider = AbstractCollider.new
        @abstract_collider.shape = Rectangle.new(0,0,5,3)
    end

    after :each do
        CollisionHandler.instance.instance_variable_set(:@colliders, [])
    end

    describe '#collides_with?' do
        context 'has a shape that overlaps another colliders shape' do

            before 'collision' do
                @other_collider = AbstractCollider.new
                @other_collider.shape = Rectangle.new(3,2,5,3)
            end

            it 'should collide with the other collider' do
                expect(@abstract_collider.collides_with?(@other_collider)).to eq true
            end
        end

        context 'has a shape that does not overlap another colliders shape' do

            before 'lack of collision' do
                @other_collider = AbstractCollider.new
                @other_collider.shape = Rectangle.new(12,1,4,3)
            end

            it 'should not collide with the other collider' do
                expect(@abstract_collider.collides_with?(@other_collider)).to eq false
            end
        end

        context 'has a shape that is right next to the other colliders shape' do

            before 'lack of collision' do
                @other_collider = AbstractCollider.new
                @other_collider.shape = Rectangle.new(5,0,5,3)
            end

            it 'should collide with the other collider' do
                expect(@abstract_collider.collides_with?(@other_collider)).to eq true
            end
        end

        describe '#init' do

            it 'should add itself to the collision handler' do
                @abstract_collider.init(nil)
                expect(CollisionHandler.instance.colliders.include?(@abstract_collider)).to be true
            end

        end
    end
end
