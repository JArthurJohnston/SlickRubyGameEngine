require_relative 'deserializer'

module SlickRubyGame
    module Serializing
        module FileIO
            WRITE_MODE = 'w'
            READ_MODE = 'r'
            READ_WRITE_MODE = 'r+'
            @@deserializer = SlickRubyGame::Serializing::Deserializer.new

            def self.save(game_object, file_location)
                write(game_object.as_json, file_location)
            end

            def self.load(file_location)
                @@deserializer.game_object_from(read(file_location))
            end

            def self.write(content, file_location)
                file = File.new(file_location, WRITE_MODE)
                file.syswrite(content)
                file.close
            end

            def self.read(file_location)
                file = open(file_location)
                content = file.read
                file.close
                return content
            end

        end
    end
end
