require_relative '../../../lib/slick_ruby_game/sprites/area_camera_perspective'
require_relative '../../../lib/slick_ruby_game/game_object'

describe 'area camera perspective' do

    before :each do
        parent = double('parent-object')
        allow(parent).to receive(:offset_y).and_return(0)
        allow(parent).to receive(:offset_x).and_return(0)
        allow(parent).to receive(:scale_y).and_return(1)
        allow(parent).to receive(:scale_x).and_return(1)

        @perspective = SlickRubyGame::AreaCameraPerspective.new
        @perspective.top_percentage_at(0.5, 50)
        @perspective.bottom_percentage_at(2.5, 150)
        @perspective.offset_y = 0
        @perspective.offset_x= 0
        @perspective.scale_y= 1
        @perspective.scale_x= 1
        @perspective.parent= parent

        @game_object = SlickRubyGame::GameObject.new
        @game_object.width= 50
        @game_object.height= 50

        @perspective.add_game_object(@game_object)
    end

    describe '#scale_delta' do
        it 'should be calculated' do
            expect(@perspective.scale_delta).to match 0.02
        end
    end

    describe '#scale_value_for' do
        it 'should subtract the top offset from the offset passed in' do
            expect(@perspective.scale_value_for(50)).to match 0.5
            expect(@perspective.scale_value_for(75)).to match 1.0
            expect(@perspective.scale_value_for(100)).to match 1.5
            expect(@perspective.scale_value_for(150)).to match 2.5
        end

        it 'should work when the offset is above (lower than) the top value' do
            expect(@perspective.scale_value_for(49)).to match 0.48
            expect(@perspective.scale_value_for(39)).to match 0.28
            expect(@perspective.scale_value_for(35)).to match 0.2
            expect(@perspective.scale_value_for(32)).to match 0.14
            expect(@perspective.scale_value_for(30)).to match 0.09999999999999998
            expect(@perspective.scale_value_for(29)).to match 0.08000000000000002
            expect(@perspective.scale_value_for(25)).to match 0.0 # << this is essentially the "horizon" in the scene
        end

        it 'should work when the offset is below (higher than) the bottom value' do
            expect(@perspective.scale_value_for(151)).to match 2.52
            expect(@perspective.scale_value_for(160)).to match 2.7
            expect(@perspective.scale_value_for(170)).to match 2.9
            expect(@perspective.scale_value_for(175)).to match 3.0
            expect(@perspective.scale_value_for(180)).to match 3.1
            expect(@perspective.scale_value_for(200)).to match 3.5
        end
    end

    it 'should scale the sub object' do
        @game_object.offset_y= 50
        @perspective.update(nil, nil)

        expect(@game_object.width).to match 25.0
        expect(@game_object.height).to match 25.0
    end
end
