require_relative '../../../lib/slick_ruby_game/serializing/serializable'
require_relative '../../../lib/slick_ruby_game/game_object'

describe SlickRubyGame::Serializing::Serializable do

    before :each do
        @game_object = SlickRubyGame::GameObject.new
        @game_object.width = 89
        @game_object.height = 65
        @game_object.scale_x = 1
        @game_object.scale_y = 1
        @game_object.offset_x = 11
        @game_object.offset_y = 22
        @game_object.identifier = 'mary'

        @child_object = SlickRubyGame::GameObject.new
        @child_object.width = 44
        @child_object.height = 55
        @child_object.scale_x = 2
        @child_object.scale_y = 2
        @child_object.offset_x = 5
        @child_object.offset_y = 7
        @child_object.identifier = 'little-lamb'

        @game_object.add_game_object(@child_object)
        @expected_child_json = '{"object_class":"SlickRubyGame::GameObject","@height":55,"@offset_x":5,"@offset_y":7,"@scale_x":2,"@width":44,"@scale_y":2,"@min_height":1.0,"@min_width":1.0,"@identifier":"little-lamb","@game_objects":[]}'
        @expected_json = '{"object_class":"SlickRubyGame::GameObject","@height":65,"@offset_x":11,"@offset_y":22,"@scale_x":1,"@width":89,"@scale_y":1,"@min_height":1.0,"@min_width":1.0,"@identifier":"mary","@game_objects":[' + @expected_child_json + ']}'
    end

    context 'serializing to json' do

        it 'should make a json string' do
            # expect(@game_object.as_json).to match '' WTF this passes! How the F@#$! does rspec allow this?!
            
            expect(@game_object.as_json).to match @expected_json
        end
        
        it 'should ignore the parent field' do
            expect(@child_object.as_json).to match @expected_child_json
        end
    end
end