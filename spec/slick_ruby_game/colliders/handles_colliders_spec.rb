require 'rspec'
require_relative '../../../lib/slick_ruby_game/colliders/has_colliders'

describe HandlesColliders do

  before 'each' do
    @subject = SlickRubyGame::Test::SubjectWithColliders.new
  end

  it 'should add a collider to its list of colliders' do
    expect(@subject.colliders.empty?).to be true

    collider = double('collider')
    @subject.add_collider(collider)

    expect(@subject.colliders.include?(collider)).to be true
  end
end

module SlickRubyGame
  module Test
    class SubjectWithColliders
      include HandlesColliders
    end
  end
end
