require_relative '../../../lib/slick_ruby_game/colliders/line_collider'

LineCollider = SlickRubyGame::Colliders::LineCollider

describe LineCollider do

    it 'should initialize with a line shape' do
        collider = LineCollider.new(0.0,1.0, 2.0,3.0)

        expect(collider.shape.get_x1).to match 0.0
        expect(collider.shape.get_y1).to match 1.0
        expect(collider.shape.get_x2).to match 2.0
        expect(collider.shape.get_y2).to match 3.0

        expect(collider.game_objects).to be_empty
    end
end
