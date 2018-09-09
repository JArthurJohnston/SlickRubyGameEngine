require_relative '../../lib/slick_ruby_game/game_object'

module SlickRubyGame

    describe GameObject do

        before 'each' do
            @level = double('level')
            @parent = double('parent-game-object')
            allow(@parent).to receive(:offset_x).and_return(0)
            allow(@parent).to receive(:offset_y).and_return(0)
            allow(@parent).to receive(:scale_x).and_return(1)
            allow(@parent).to receive(:scale_y).and_return(1)
            allow(@parent).to receive(:level).and_return(@level)
            allow(@parent).to receive(:identifier).and_return('parent-object')
            allow(@parent).to receive(:fully_qualified_identifier).and_return('parent-object')
            @game_object = GameObject.new
            @game_object.parent= @parent
            @game_object.identifier = 'cool-game-object'
        end

        it 'should return its parents level' do
            expect(@game_object.level).to be @level
        end

        it 'should have an identifier' do
            expect(@game_object.identifier).to match 'cool-game-object'
        end

        it 'should return a fully qualified identifier with its parent id' do
            expect(@game_object.fully_qualified_identifier).to match 'parent-object.cool-game-object'
        end

        it 'should return its class as the identifier with its parent id' do
            @game_object.identifier = nil
            expect(@game_object.identifier).to match 'SlickRubyGame::GameObject'
        end

        context 'default values' do
            it 'should have an empty list of game objects' do
                expect(@game_object.game_objects).to be_empty
            end

            it 'should have zeroed offsets' do
                expect(@game_object.offset_x).to be 0
                expect(@game_object.offset_y).to be 0
            end

        end

        context 'setting fields' do
            it 'should be able to update offsets' do
                @game_object.offset_x= 2423
                @game_object.offset_y=768

                expect(@game_object.offset_x).to match(2423)
                expect(@game_object.offset_y).to match(768)
            end
        end


        context 'with some sub game objects' do
            before 'using a game object' do
                @sub_game_object1 = double('game-object-1')
                @sub_game_object2 = double('game-object-2')
                allow(@sub_game_object1).to receive(:parent=)
                allow(@sub_game_object2).to receive(:parent=)
                @graphics_container = double('graphics-container')
                @delta = 23432.2342
                @game_object.game_objects = [@sub_game_object1, @sub_game_object2]
            end

            describe '#update' do
                it 'should call update and post update' do
                    expect(@sub_game_object1).to receive(:update).with(@graphics_container, @delta)
                    expect(@sub_game_object1).to receive(:post_update).with(@graphics_container, @delta)

                    expect(@sub_game_object2).to receive(:update).with(@graphics_container, @delta)
                    expect(@sub_game_object2).to receive(:post_update).with(@graphics_container, @delta)

                    @game_object.update(@graphics_container, @delta)
                end
            end

            describe '#render' do
                it 'should call render on sub game objects' do
                    graphics = double('graphics')
                    expect(@sub_game_object1).to receive(:render).with(@graphics_container, graphics)
                    expect(@sub_game_object2).to receive(:render).with(@graphics_container, graphics)

                    @game_object.render(@graphics_container, graphics)
                end
            end

            describe '#init' do
                it 'should call init on sub game objects' do
                    expect(@sub_game_object1).to receive(:init).with(@graphics_container)
                    expect(@sub_game_object2).to receive(:init).with(@graphics_container)

                    @game_object.init(@graphics_container)
                end
            end
        end

        context 'adding game objects' do
            before 'adding game objects' do
                @game_object1 = GameObject.new
                @game_object2 = GameObject.new
                @game_object3 = GameObject.new
            end

            describe '#add_game_object' do
                before 'each' do
                    @game_object1.add_game_object(@game_object2)
                end

                it 'should have added the other game object' do
                    expect(@game_object1.game_objects.include?(@game_object2)). to be true
                end

                it 'should set itself as their parent object' do
                    expect(@game_object1.parent).to be nil
                    expect(@game_object2.parent).to be @game_object1
                end

                it 'should thrown an error for duplicate game object ids' do
                    fail
                end
            end

            describe '#game_objects=' do
                before 'each' do
                    @game_object1.game_objects = [@game_object2, @game_object3]
                end

                it 'should have added the other game objects' do
                    expect(@game_object1.game_objects.include?(@game_object2)). to be true
                    expect(@game_object1.game_objects.include?(@game_object3)). to be true
                end

                it 'should set itself as their parent object' do
                    expect(@game_object1.parent).to be nil
                    expect(@game_object2.parent).to be @game_object1
                    expect(@game_object3.parent).to be @game_object1
                end
            end

            describe 'scaled offsets' do

                before 'each' do
                    @parent = double('parent-game-object')
                    allow(@parent).to receive(:offset_x).and_return(0)
                    allow(@parent).to receive(:offset_y).and_return(0)
                    allow(@parent).to receive(:scale_x).and_return(3.4)
                    allow(@parent).to receive(:scale_y).and_return(2.7)

                    @game_object.offset_x = 4
                    @game_object.offset_y = 7

                    @game_object.parent= @parent
                end

                it 'should add scaling to its offsets' do
                    expect(@game_object.offset_x).to be_within(0.01).of 13.6
                    expect(@game_object.offset_y).to be_within(0.01).of 18.9
                end

            end

            describe '#find' do
                before :each do
                    @sub1 = GameObject.new
                    @sub1.identifier = 'sub-one'

                    @sub2 = GameObject.new
                    @sub2.identifier = 'sub-two'

                    @sub3 = GameObject.new
                    @sub3.identifier = 'sub-three'

                    @sub1.add_game_object(@sub2)
                    @game_object.add_game_object(@sub1)
                    @game_object.add_game_object(@sub3)
                end

                it 'should find sub game objects with their identifiers' do
                    found1 = @game_object.find('parent-object.cool-game-object.sub-one')
                    found2 = @game_object.find('parent-object.cool-game-object.sub-one.sub-two')
                    found3 = @game_object.find('parent-object.cool-game-object.sub-three')

                    expect(found1).to be @sub1
                    expect(found2).to be @sub2
                    expect(found3).to be @sub3
                end

                it 'should return nil when not found' do
                    expect(@game_object.find('non-existent')).to be_nil
                end
            end
        end
    end
end
