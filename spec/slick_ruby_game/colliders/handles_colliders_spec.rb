require 'rspec'
require_relative '../../../lib/slick_ruby_game/colliders/handles_colliders'

describe 'HandlesColliders' do

  before 'each' do
    @subject = SlickRubyGame::Test::SubjectWithColliders.new
  end

  it 'should add a collider to its list of colliders' do
    expect(@subject.colliders.empty?).to be true

    collider = double('collider')
    @subject.add_collider(collider)

    expect(@subject.colliders.include?(collider)).to be true
  end

  context 'with a list of colliders' do

    before 'each' do
      @collider1 = double('collider1')
      allow(@collider1).to receive(:parent=)
      @collider2 = double('collider2')
      allow(@collider2).to receive(:parent=)
      @collider3 = double('collider3')
      allow(@collider3).to receive(:parent=)

      @subject.colliders = [@collider1, @collider2, @collider3]
    end

    describe '#process_collisions' do
      it 'should process collisions for each collider' do
        expect(@collider1).to receive(:collides_with?).with(@collider2)
        expect(@collider1).to receive(:collides_with?).with(@collider3)
        expect(@collider2).to receive(:collides_with?).with(@collider3)

        expect(@collider1).to receive(:finished_colliding)
        expect(@collider2).to receive(:finished_colliding)
        expect(@collider3).to receive(:finished_colliding)

        @subject.process_collisions
      end

      it 'should handle collisions for colliders that collided' do
        expect(@collider1).to receive(:collides_with?).with(@collider2).and_return(false)
        expect(@collider1).to receive(:collides_with?).with(@collider3).and_return(true)
        expect(@collider2).to receive(:collides_with?).with(@collider3).and_return(false)

        expect(@collider1).to receive :handle_collision
        expect(@collider3).to receive :handle_collision

        expect(@collider1).to receive(:finished_colliding)
        expect(@collider2).to receive(:finished_colliding)
        expect(@collider3).to receive(:finished_colliding)

        @subject.process_collisions
      end
    end

  end

  context 'with no colliders' do

    it 'should do nothing when processing collisions' do
      @subject.process_collisions
    end

    it 'should be able to add a collider' do
      collider = double('collider')
      @subject.add_collider(collider)

      expect(@subject.colliders.first).to be collider
    end

    it 'should be able to add a collider' do
      collider1 = double('collider-1')
      collider2 = double('collider-2')
      @subject.colliders=[collider1, collider2]

      expect(@subject.colliders.at(0)).to be collider1
      expect(@subject.colliders.at(1)).to be collider2
    end

  end
end

module SlickRubyGame
  module Test
    class SubjectWithColliders
      include SlickRubyGame::Colliders::HandlesColliders
    end
  end
end
