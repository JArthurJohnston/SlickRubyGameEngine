require_relative '../../../lib/slick_ruby_game/serializing/file_io'
require_relative '../../../lib/slick_ruby_game/game_object'

module SlickRubyGame
    module Test
        FileIO = SlickRubyGame::Serializing::FileIO

        describe 'FileIO' do

            before :each do
                @game_object = SlickRubyGame::GameObject.new
                @game_object.width = 89
                @game_object.height = 65
                @game_object.scale_x = 1
                @game_object.scale_y = 1
                @game_object.offset_x = 11
                @game_object.offset_y = 22
                @game_object.identifier = 'mary'
            end
        
            it 'should save the object json to a file' do
                FileIO.save(@game_object, './spec/res/test_game_object.json')

                expect(File.read('./spec/res/test_game_object.json')).to match @game_object.as_json
            end
        
            it 'should read an object from a file' do
                loaded_object = FileIO.load('./spec/res/test_example.json')

                expect(loaded_object.identifier).to match 'test-example'
            end
        
        end
    end
    
end

