require 'rspec'
require_relative '../../../lib/slick_ruby_game/colliders/physical_rectangle_collider'

describe 'physical rectangle collider' do

    context '#init' do
        before 'creating the rectangle' do
            @collider = SlickRubyGame::Colliders::PhysicalRectangleCollider.new
            @collider.width = 4
            @collider.height = 7
            @parent_x_offset = 30
            @parent_y_offset = 50
            @parent = double('parent-game-object')
            allow(@parent).to receive(:add_collider).with(@collider)
            allow(@parent).to receive(:offset_x).and_return(@parent_x_offset)
            allow(@parent).to receive(:offset_y).and_return(@parent_y_offset)
            allow(@parent).to receive(:local_offset_x).and_return(@parent_x_offset)
            allow(@parent).to receive(:local_offset_y).and_return(@parent_y_offset)
            allow(@parent).to receive(:width).and_return(10)
            allow(@parent).to receive(:height).and_return(10)
            allow(@parent).to receive(:scale_x).and_return(1)
            allow(@parent).to receive(:scale_y).and_return(1)
            @collider.parent= @parent

            @collider.offset_x = 5
            @collider.offset_y = 6

            @collider.init(nil)
        end

        it 'should create a rectangle' do
            expect(@collider.shape.class).to be Rectangle
            expect(@collider.shape.get_x).to match 35
            expect(@collider.shape.get_y).to match 56

            expect(@collider.shape.get_width).to match 4
            expect(@collider.shape.get_height).to match 7
        end

        it 'should update the rectangles width and height on update' do
            allow(@parent).to receive(:scale_x).and_return(2)

            @collider.update(nil, nil)

            expect(@collider.shape.get_width).to match 8

        end
    end

end

