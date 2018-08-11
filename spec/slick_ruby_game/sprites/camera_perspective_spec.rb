require_relative '../../../lib/slick_ruby_game/sprites/camera_perspective'
require_relative '../../../lib/slick_ruby_game/game_object'


describe SlickRubyGame::CameraPerspective do

    before :each do
        @expected_height = 50
        subject_parent = double('mock-parent')
        allow(subject_parent).to receive(:scale_x).and_return(1)
        allow(subject_parent).to receive(:scale_y).and_return(1)
        allow(subject_parent).to receive(:offset_x).and_return(0)
        allow(subject_parent).to receive(:offset_y).and_return(0)
        allow(subject_parent).to receive(:width).and_return(30)
        allow(subject_parent).to receive(:height).and_return(@expected_height)


        @subject = SlickRubyGame::CameraPerspective.new
        @subject.top_percentage= 0.1
        @subject.bottom_percentage= 1.6

        @subject.parent= subject_parent

        @game_object = SlickRubyGame::GameObject.new
        @game_object.width=10
        @game_object.height=10
        @game_object.offset_y= 20
        @subject.add_game_object(@game_object)
    end

    it 'should scale sub objects when initing them' do
        expect(@game_object.width).to match 10

        @subject.init(nil)

        expect(@game_object.width).to be_within(0.01).of 6.0
    end

    it 'should scale sub objects when updating them' do
        expect(@game_object.width).to match 10

        @subject.update(nil, nil)

        expect(@game_object.width).to be_within(0.01).of 6.0
    end

    it 'should calculate y_delta upon init' do
        expected_y_delta = 0.03

        expect(@subject.calculate_y_delta).to be_within(0.0001).of(expected_y_delta)
    end

end

