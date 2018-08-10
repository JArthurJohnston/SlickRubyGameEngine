require_relative '../../lib/slick_ruby_game/scalable'

describe SlickRubyGame::Scalable do

    before :each do
        @subject = ScalableObject.new
    end

    context 'default values' do

        it 'should have scales set to 1' do
            expect(@subject.scale_x).to match 1
            expect(@subject.scale_y).to match 1

            expect(@subject.width).to match 5
            expect(@subject.height).to match 10
        end
    end

    context 'scaling' do

        before 'scaling' do
            @subject.scale_x = 2
            @subject.scale_y = 0.25
        end

        it 'should scale width and height' do
            expect(@subject.width).to match 10
            expect(@subject.height).to match 2.5
        end
    
    end

end

class ScalableObject
    include SlickRubyGame::Scalable

    def initialize
        super # << necessary when using this module
        @width = 5
        @height = 10
    end
end