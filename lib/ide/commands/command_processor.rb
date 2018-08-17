
module SlickRubyGame
    module IDE
        module Commands
            class CommandProcessor
                @@INSTANCE = CommandProcessor.new
        
                def self.instance
                    return @@INSTANCE
                end

                def handle(command)
                    command.execute
                end
        
                private_class_method :new
            end
        end
    end
end