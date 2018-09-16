require_relative '../../../lib/slick_ruby_game/environments/sliding_background'
require_relative '../../../lib/slick_ruby_game/picture'

describe 'SlidingBackground' do

    before :each do
        @target = SlickRubyGame::GameObject.new
        @target.offset_x= 50
        @target.offset_y= 50

        @picture = SlickRubyGame::Picture.new
        
        @subject = SlickRubyGame::Environments::SlidingBackground.new
        @subject.target= @target
        @subject.picture= @picture

        parent = double('parent game object')
        allow(parent).to receive(:offset_x).and_return 0
        allow(parent).to receive(:offset_y).and_return 0
        allow(parent).to receive(:scale_x).and_return 1
        allow(parent).to receive(:scale_y).and_return 1

        @subject.parent= parent
        @subject.camera_x= 50
        @subject.camera_y= 50
        @subject.camera_radius= 10
    end

    it 'should include target and picture in its list of game objects' do
        expect(@subject.game_objects.include?(@target)).to be true
        expect(@subject.game_objects.include?(@picture)).to be true
    end

    it 'should be the parent of the target and picture' do
        expect(@target.parent).to be @subject
        expect(@picture.parent).to be @subject
    end

    describe '#update' do

        before :each do
            @target.offset_x= 61
            @subject.update(nil, nil)
        end

        it 'should update the offset of the picture when the target moves' do
            expect(@picture.offset_x).to match 1
            expect(@target.offset_x).to match 60
        end

    end

end
