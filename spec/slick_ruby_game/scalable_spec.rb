require_relative '../../lib/slick_ruby_game/scalable'

describe SlickRubyGame::Scalable do

    before :each do
        parent = double('parent')
        allow(parent).to receive(:scale_x).and_return 1.0
        allow(parent).to receive(:scale_y).and_return 1.0
        allow(parent).to receive(:offset_x).and_return 0.0
        allow(parent).to receive(:offset_y).and_return 0.0
        @scalable_parent = ScalableObject.new
        @scalable_parent.parent= parent
        
        @subject = ScalableObject.new
        @subject.parent= @scalable_parent
    end

    context 'default values' do

        it 'should have scales set to 1' do
            expect(@subject.scale_x).to match 1.0
            expect(@subject.scale_y).to match 1.0

            expect(@subject.width).to match 5.0
            expect(@subject.height).to match 10.0
        end

        it 'should have a minimum width and height' do
            expect(@subject.min_width).to match 1.0
            expect(@subject.min_height).to match 1.0
        end
    end

    context 'scaling' do

        before 'scaling' do
            @subject.scale_x = 2.0
            @subject.scale_y = 0.25
        end

        it 'should scale width and height' do
            expect(@subject.width).to match 10.0
            expect(@subject.height).to match 2.5
        end

        context 'width and height' do

            it 'should scale them' do
                @subject.scale_x = 2
                @subject.scale_y = 3

                expect(@subject.width).to match 10.0
                expect(@subject.height).to match 30.0
            end

            it 'should return the minimums when theyre too small' do
                @subject.scale_x = 0.15
                @subject.scale_y = 0.015

                expect(@subject.width).to match 1.0
                expect(@subject.height).to match 1.0
            end

            it 'should return user set minimums when theyre too small' do
                @subject.scale_x = 0.15
                @subject.scale_y = 0.015
                @subject.min_height = 3.0
                @subject.min_width = 3.0

                expect(@subject.width).to match 3.0
                expect(@subject.height).to match 3.0
            end

        end


        context 'with parent' do
            before :each do
                @scalable_parent.scale_x = 2
                @scalable_parent.scale_y = 3
            end

            it 'should multiply scales with parent scales' do
                expect(@subject.scale_x).to match 4.0
                expect(@subject.scale_y).to match 0.75

                expect(@subject.width).to match 20.0
                expect(@subject.height).to match 7.5
            end
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