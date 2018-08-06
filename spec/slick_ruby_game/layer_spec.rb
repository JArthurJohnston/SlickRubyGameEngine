require 'rspec'

require_relative '../../lib/slick_ruby_game/layer'
require_relative '../../lib/slick_ruby_game/colliders/abstract_collider'

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
      expect(@collider1).to receive(:collides_with?).with(@collider2)
      expect(@collider1).to receive(:collides_with?).with(@collider3)
      expect(@collider2).to receive(:collides_with?).with(@collider3)

      expect(@collider1).to receive :finished_colliding
      expect(@collider2).to receive :finished_colliding
      expect(@collider3).to receive :finished_colliding

      gc = double('graphics-container')
      delta = 7724

      @layer.post_update(gc, delta)
    end

  end

  context 'collision handling' do
    before 'each' do
      @layer = SlickRubyGame::Layer.new
      @collider = SlickRubyGame::Colliders::AbstractCollider.new
      @parent_object = SlickRubyGame::GameObject.new
    end

    it 'should handle collisions' do
      @layer.add_collider(@collider)
      
      expect(@layer.colliders.include?(@collider)).to be true
    end

    it 'should handle child colliders' do
      @layer.add_game_object(@parent_object)
      @parent_object.add_game_object(@collider)

      expect(@layer.colliders.include?(@collider)).to be true
    end


  end

end