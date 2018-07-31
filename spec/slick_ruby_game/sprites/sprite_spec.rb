require 'rspec'

require_relative '../../../lib/slick_ruby_game/sprites/sprite'

describe SlickRubyGame::Sprite do

  before 'each' do
    @sprite = SlickRubyGame::Sprite.new
    
  end

  describe '#render' do

    before 'rendering' do
        @expected_x_offset = 3243242
        @expected_y_offset = 87675
        @expected_render_width = 234
        @expected_render_height = 423
        @sprite.offset_x = @expected_x_offset
        @sprite.offset_y = @expected_y_offset
        @sprite.render_width = @expected_render_width
        @sprite.render_height = @expected_render_height

        @animation_double = double('animation')
        @sprite.instance_variable_set(:@sprite_animation, @animation_double)
    end

    it 'should draw the sprite animation' do
        expect(@animation_double).to receive(:draw).with(@expected_x_offset, @expected_y_offset, @expected_render_width, @expected_render_height)

        @sprite.render(nil, nil)
    end

  end

end