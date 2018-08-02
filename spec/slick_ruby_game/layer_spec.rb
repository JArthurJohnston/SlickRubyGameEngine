require 'rspec'

require_relative '../../lib/slick_ruby_game/layer'

describe SlickRubyGame::Layer do

  before 'each' do
    @layer = SlickRubyGame::Layer.new

    @collider1 = double('collider1')
    allow(@collider1).to receive(:parent=)
    @collider2 = double('collider2')
    allow(@collider2).to receive(:parent=)
    @collider3 = double('collider3')
    allow(@collider3).to receive(:parent=)

    @layer.colliders = [@collider1, @collider2, @collider3]
  end

  describe '#post_update' do

    it 'should handle collisions for sub game objects' do
      expect(@collider1).to receive(:handle_collision_with)
      expect(@collider1).to receive(:handle_collision_with)
      expect(@collider2).to receive(:handle_collision_with)

      gc = double('graphics-container')
      delta = 7724

      @layer.post_update(gc, delta)
    end

  end

  context 'collision handling' do
    it 'should handle collisions' do
      fail
    end
  end

end