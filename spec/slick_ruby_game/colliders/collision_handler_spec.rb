require_relative '../../../lib/slick_ruby_game/colliders/collision_handler'

CollisionHandler = SlickRubyGame::Colliders::CollisionHandler

describe 'Collision Handler' do

    before 'each' do
        @handler = CollisionHandler.instance

        @collider1 = double('collider1')
        @collider2 = double('collider2')
        @collider3 = double('collider3')

        @handler.add_collider(@collider1)
        @handler.add_collider(@collider2)
        @handler.add_collider(@collider3)
    end

    after :each do
        CollisionHandler.instance.instance_variable_set(:@colliders, [])
    end

    it 'should be a singleton' do
        expect(@handler).to be CollisionHandler.instance
    end

    it 'should process collisions' do
        expect(@collider1).to receive(:collides_with?).with(@collider2)
        expect(@collider1).to receive(:collides_with?).with(@collider3)
        expect(@collider2).to receive(:collides_with?).with(@collider3)

        expect(@collider1).to receive :finished_colliding
        expect(@collider2).to receive :finished_colliding
        expect(@collider3).to receive :finished_colliding

        @handler.process_collisions
    end
end