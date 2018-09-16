require_relative '../../../lib/slick_ruby_game/helpers/point_math'

include SlickRubyGame::Helpers::PointMath

describe '#distance_between' do
    it 'should return the distance between two points' do
        expect(distance_between(1, 1, 1, 1)).to match 0.0
        expect(distance_between(0, 1, 0, 5)).to match 4.0
        expect(distance_between(5, 0, 1, 0)).to match 4.0
        expect(distance_between(0, 0, 5, 5)).to be_within(0.0001).of 7.071
        expect(distance_between(5, 5, 0, 0)).to be_within(0.0001).of 7.071
    end
end
