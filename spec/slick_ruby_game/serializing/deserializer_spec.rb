require_relative '../../../lib/slick_ruby_game/serializing/deserializer'

describe SlickRubyGame::Serializing::Deserializer do

    before :each do 
        @expected_child_json = '{"object_class":"SlickRubyGame::GameObject","@height":55,"@offset_x":5,"@offset_y":7,"@scale_x":2,"@width":44,"@scale_y":2,"@identifier":"little-lamb","@game_objects":[]}'
        @expected_json = '{"object_class":"SlickRubyGame::GameObject","@height":65,"@offset_x":11,"@offset_y":22,"@scale_x":1,"@width":89,"@scale_y":1,"@identifier":"mary","@game_objects":[' + @expected_child_json + ']}'
    end
    
end
