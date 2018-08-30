include Java
require_relative '../../../lib/slick_ruby_game/include_slick'
require_relative '../../../lib/slick_ruby_game/colliders/abstract_collider'

java_import org.newdawn.slick.geom.Rectangle

AbstractCollider = SlickRubyGame::Colliders::AbstractCollider
CollisionHandler = SlickRubyGame::Colliders::CollisionHandler

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

        context 'collision observers' do

            before :each do
                @observer = double('observing game object')
            end

            it 'should start with an empty list of observers' do
                expect(@abstract_collider.collision_triggers).to be_empty
                expect(@abstract_collider.finished_triggers).to be_empty
            end

            it 'should add collision triggers to its list' do
                @abstract_collider.on_collision_trigger(@observer, :do_something)

                expect(@abstract_collider.collision_triggers.size).to match 1
                stored_observer = @abstract_collider.collision_triggers.first

                expect(stored_observer.game_object).to be @observer
                expect(stored_observer.triggered_method).to be :do_something
            end

            it 'should add finished triggers to its list' do
                @abstract_collider.on_finished_colliding(@observer, :do_something)

                expect(@abstract_collider.finished_triggers.size).to match 1
                stored_observer = @abstract_collider.finished_triggers.first

                expect(stored_observer.game_object).to be @observer
                expect(stored_observer.triggered_method).to be :do_something
            end

            it 'should call the triggerd method on collision' do
                @abstract_collider.on_collision_trigger(@observer, :do_something)

                expect(@observer).to receive(:do_something)

                @abstract_collider.handle_collision
            end

            it 'should call the triggerd method on collision' do
                @abstract_collider.on_finished_colliding(@observer, :do_something_else)

                expect(@observer).to receive(:do_something_else)

                @abstract_collider.finished_colliding
            end
        end
    end
end
