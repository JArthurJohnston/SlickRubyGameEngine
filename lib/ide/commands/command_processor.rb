
module SlickRubyGame
    module IDE
        module Commands
            class CommandProcessor
        
                def initialize(ide)
                    @ide = ide
                end

                def handle(command)
                    command.execute
                end
            end
        end
    end
end