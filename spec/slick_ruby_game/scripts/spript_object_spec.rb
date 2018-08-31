require_relative '../../../lib/slick_ruby_game/scripts/script_object'

describe 'Script Objects' do

    before :each do
        @script_object = SlickRubyGame::Scripts::ScriptObject.new
        @script_object.file_path= './spec/slick_ruby_game/scripts/test_script.rb'
        @script_object.module_name= 'TestScript'
    end

    describe '#init' do
        before :each do
            @game_container = double('gamme contaner')
            @script_object.init(@game_container)
        end

        it 'should load an instance of the script' do
            expect(@script_object.script.class).to be TestScript
            expect(@script_object.script.test_method).to match 'test value'
        end

        it 'should call the scrpts init method' do
            expect(@script_object.script.init_called).to be true
            expect(@script_object.script.game_container).to be @game_container
        end

        it 'should set its parents to the scripts parent' do
            fail
        end

    end


    describe '#render' do
        before :each do
            @graphics = double('graphics')
            @game_container = double('gamme contaner')

            @script_object.init(nil)
            @script_object.render(@game_container, @graphics)
        end

        it 'should call render on script' do
            expect(@script_object.script.render_called).to be true
            expect(@script_object.script.game_container).to be @game_container
            expect(@script_object.script.graphics).to be @graphics
        end

        describe '#update' do
            before :each do
                @delta = 23423
                @game_container = double('gamme contaner')

                @script_object.init(nil)
                @script_object.update(@game_container, @delta)
            end
    
            it 'should call render on script' do
                expect(@script_object.script.update_called).to be true
                expect(@script_object.script.game_container).to be @game_container
                expect(@script_object.script.delta).to be @delta
            end
        end
    end


end
