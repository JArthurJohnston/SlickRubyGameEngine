require_relative '../../lib/slick_ruby_game/level'
require_relative 'mock_helper'

describe SlickRubyGame::Level do

  before 'each' do
    @level = SlickRubyGame::Level.new
    @layer = @level.layers.first
  end

  describe 'default values' do

    it 'should have default layers' do
      expect(@level.layers.size).to be 1
      expect(@level.layers.first.identifier).to match 'Default'
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

      @level.add_game_object

      fail

    end

  end

end