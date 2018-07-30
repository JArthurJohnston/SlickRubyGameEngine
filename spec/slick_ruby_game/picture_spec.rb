
require_relative '../../lib/slick_ruby_game/picture'

describe SlickRubyGame::Picture do

    before 'each' do
        @picture = SlickRubyGame::Picture.new
        @image_double = double('image')
        @picture.instance_variable_set(:@image, @image_double)
    end

    describe '#render' do

        before 'drawing the image' do
            @expected_x = 4423
            @expected_y = 9786
            @picture.start_x = @expected_x
            @picture.start_y = @expected_y
        end

        it 'should draw the image' do
            expect(@image_double).to receive(:draw).with(@expected_x, @expected_y)

            @picture.render(nil, nil)
        end
    end
end