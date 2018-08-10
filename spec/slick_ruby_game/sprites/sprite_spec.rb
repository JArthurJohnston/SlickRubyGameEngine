require 'rspec'

require_relative '../../../lib/slick_ruby_game/sprites/sprite'

describe SlickRubyGame::Sprite do

  before 'each' do
    parent = double('parent')
    allow(parent).to receive(:offset_x).and_return(0)
    allow(parent).to receive(:offset_y).and_return(0)
    allow(parent).to receive(:scale_x).and_return(1)
    allow(parent).to receive(:scale_y).and_return(1)

    @game_object = double('game-object')
    allow(@game_object).to receive(:parent=)

    allow(@game_object).to receive(:offset_x).and_return(0)
    allow(@game_object).to receive(:offset_y).and_return(0)
    @sprite = SlickRubyGame::Sprite.new
    @sprite.add_game_object(@game_object)
    @sprite.parent= parent
  end

  describe '#render' do

    before 'rendering' do
        @expected_x_offset = 3243242
        @expected_y_offset = 87675
        @expected_width = 234
        @expected_height = 423
        @sprite.offset_x = @expected_x_offset
        @sprite.offset_y = @expected_y_offset
        @sprite.width = @expected_width
        @sprite.height = @expected_height

        @animation_double = double('animation')
        @sprite.instance_variable_set(:@sprite_animation, @animation_double)
    end

    it 'should draw the sprite animation' do
        expect(@animation_double).to receive(:draw).with(@expected_x_offset, @expected_y_offset, @expected_width, @expected_height)
        expect(@game_object).to receive(:render).with(nil, nil)

        @sprite.render(nil, nil)
    end

  end

end