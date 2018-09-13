
module SlickRubyGame
    module IDE
        module Commands
            class CommandProcessor
        
                def initialize(ide_state)
                    @ide_state = ide_state
                end

                def handle(command)
                    command.execute(@ide_state)
                end
                
            end
        end
    end
end