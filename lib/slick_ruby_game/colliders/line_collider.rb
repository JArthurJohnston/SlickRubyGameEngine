include Java
require_relative '../include_slick'
require_relative 'abstract_collider'

java_import org.newdawn.slick.geom.Line

module SlickRubyGame::Colliders
    class LineCollider < AbstractCollider

        def initialize(xa, ya, xb, yb)
            super()
            @shape = Line.new(xa, ya, xb, yb)
        end
    end
end