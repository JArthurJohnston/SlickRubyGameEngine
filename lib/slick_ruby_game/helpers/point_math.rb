
module SlickRubyGame
    module Helpers
        module PointMath
            def distance_between(xOne, yOne, xTwo, yTwo)
                Math.sqrt((xTwo - xOne) ** 2 + (yTwo - yOne) ** 2)
            end
        end
    end
end