require 'rspec'
require_relative '../../lib/slick_ruby_game/picture'

describe SlickRubyGame::Picture do

    before 'each' do
        parent = double('parent')
        allow(parent).to receive(:offset_x).and_return(0)
        allow(parent).to receive(:offset_y).and_return(0)
        allow(parent).to receive(:scale_x).and_return(1)
        allow(parent).to receive(:scale_y).and_return(1)
        @picture = SlickRubyGame::Picture.new
        @picture.parent= parent
        @image_double = double('image')
        @picture.instance_variable_set(:@image, @image_double)
    end

    describe '#render' do

        before 'drawing the image' do
            @expected_x = 4423
            @expected_y = 9786
            @picture.offset_x = @expected_x
            @picture.offset_y = @expected_y
        end

        it 'should draw the image' do
            expect(@image_double).to receive(:draw).with(@expected_x, @expected_y)

            @picture.render(nil, nil)
        end
    end
end
