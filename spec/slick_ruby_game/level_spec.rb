require_relative '../../lib/slick_ruby_game/level'
require_relative 'mock_helper'

describe SlickRubyGame::Level do

  before 'each' do
    @level = SlickRubyGame::Level.new
    @layer = @level.layers.first
  end

  describe 'default values' do

    it 'should have default layers' do
      expect(@level.layers.size).to match 1
      expect(@level.layers.first.identifier).to match 'Default'
      expect(@level.layers.first.parent).to be @level

    end
  end

  describe '#game_objects' do
    it 'should return layers as its list of game objects' do
      expect(@level.game_objects).to be @level.layers
    end
  end

  context 'adding game objects' do

    it 'should add game objects to its default layer' do
      game_object = double('game-object')
      expect(game_object).to receive(:parent=).with(@layer)

      @level.add_game_object(game_object)

      expect(@layer.game_objects.first).to be game_object
    end

    it 'should add layers to its layers' do
      layer2 = double('layer-2')

      expect(layer2).to receive(:parent=).with(@level)

      @level.add_layer(layer2)

      expect(@level.layers.last).to be layer2
    end

  end

  context 'updating' do
    before :each do
      CollisionHandler.instance.instance_variable_set(:@colliders, [])
      @collider1 = double 'collider'
      @collider2 = double 'collider'
      SlickRubyGame::Colliders::CollisionHandler.instance.add_collider(@collider1)
      SlickRubyGame::Colliders::CollisionHandler.instance.add_collider(@collider2)
    end

    after :each do
      CollisionHandler.instance.instance_variable_set(:@colliders, [])
    end

    it 'should tigger collision handling' do
      expect(@collider1).to receive :collides_with?

      expect(@collider1).to receive :finished_colliding
      expect(@collider2).to receive :finished_colliding

      @level.update(nil, nil)
    end
  end
end