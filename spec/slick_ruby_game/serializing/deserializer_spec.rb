require_relative '../../../lib/slick_ruby_game/serializing/deserializer'

module SerializingTestHelper
    def check_child_object(game_object)
        expect(game_object.class).to be SlickRubyGame::GameObject
        expect(game_object.instance_variable_get(:@width)).to       match 44
        expect(game_object.instance_variable_get(:@height)).to      match 55
        expect(game_object.instance_variable_get(:@offset_x)).to    match 5
        expect(game_object.instance_variable_get(:@offset_y)).to    match 7
        expect(game_object.instance_variable_get(:@scale_x)).to     match 2
        expect(game_object.instance_variable_get(:@scale_y)).to     match 2
        expect(game_object.instance_variable_get(:@identifier)).to  match 'little-lamb'
        expect(game_object.game_objects).to be_empty
    end
end

RSpec.configure do |c|
    c.include SerializingTestHelper
end

describe SlickRubyGame::Serializing::Deserializer do

    before :each do 
        @deserializer = SlickRubyGame::Serializing::Deserializer.new
        @expected_child_json = '{"object_class":"SlickRubyGame::GameObject","@height":55,"@offset_x":5,"@offset_y":7,"@scale_x":2,"@width":44,"@scale_y":2,"@identifier":"little-lamb","@game_objects":[]}'
        @expected_json = '{"object_class":"SlickRubyGame::GameObject","@height":65,"@offset_x":11,"@offset_y":22,"@scale_x":1,"@width":89,"@scale_y":1,"@identifier":"mary","@game_objects":[' + @expected_child_json + ']}'
    end

    it 'should return a game object from json' do
        game_object = @deserializer.game_object_from(@expected_child_json)
        check_child_object(game_object)
    end

    it 'should return a game object and sub game objects from json' do
        game_object = @deserializer.game_object_from(@expected_json)

        expect(game_object.class).to be SlickRubyGame::GameObject
        expect(game_object.instance_variable_get(:@width)).to       match 89
        expect(game_object.instance_variable_get(:@height)).to      match 65
        expect(game_object.instance_variable_get(:@offset_x)).to    match 11
        expect(game_object.instance_variable_get(:@offset_y)).to    match 22
        expect(game_object.instance_variable_get(:@scale_x)).to     match 1
        expect(game_object.instance_variable_get(:@scale_y)).to     match 1
        expect(game_object.instance_variable_get(:@identifier)).to  match 'mary'
        expect(game_object.game_objects.size).to match 1

        check_child_object(game_object.game_objects.first)
    end
    
end
