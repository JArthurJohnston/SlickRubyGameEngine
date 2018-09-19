require_relative '../../../lib/slick_ruby_game/ui/scrolling_text'

describe 'ScrollingText' do

    before :each do
        @subject = SlickRubyGame::UI::ScrollingText.new
        @subject.speed = 2
        @subject.content= 'The rain in spain falls'
    end

    it 'should return an empty string for its content before update' do
        expect(@subject.content).to match ''
    end

    it 'should render text when time has elapsed' do
        @subject.update(nil, 1)

        expect(@subject.content).to match ''

        @subject.update(nil, 3)

        expect(@subject.content).to match 'Th'

        @subject.update(nil, 4)

        expect(@subject.content).to match 'The r'
    end

    it 'should render the full string after enough time has elapsed' do
        @subject.update(nil, 48)

        expect(@subject.content).to match 'The rain in spain falls'

        @subject.update(nil, 50)

        expect(@subject.content).to match 'The rain in spain falls'

        @subject.update(nil, 127)

        expect(@subject.content).to match 'The rain in spain falls'
    end
end
