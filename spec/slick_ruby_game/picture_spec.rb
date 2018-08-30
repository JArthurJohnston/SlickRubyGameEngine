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
            @expected_height = 2423
            @expected_width = 86766
            @picture.offset_x = @expected_x
            @picture.offset_y = @expected_y
            @picture.width = @expected_width
            @picture.height = @expected_height
        end

        it 'should draw the image' do
            expect(@image_double).to receive(:draw).with(@expected_x, @expected_y, @expected_width, @expected_height)

            @picture.render(nil, nil)
        end
    end

    context 'serializing' do
        before :each do
            @picture.identifier = 'test-picture'
            @picture.offset_x = 5
            @picture.offset_y = 6
            @picture.scale_x = 2
            @picture.scale_y = 3
            @picture.width = 10
            @picture.height = 11
            @picture.image_location = '../res/test.png'
        end

        it 'should make a json string' do
            expect(@picture.as_json).to match('{"object_class":"SlickRubyGame::Picture","@height":11,"@offset_x":5,"@offset_y":6,"@scale_x":2,"@width":10,"@scale_y":3,"@image_location":"../res/test.png","@identifier":"test-picture","@game_objects":[]}')
        end

    end
end
