require_relative '../../../lib/slick_ruby_game/content_management/image_manager'

describe 'Image Manager' do

    before :each do 
        @mock_factory = double('image-factory')
        @mock_image = double('image')
        allow(@mock_factory).to receive(:load).and_return(@mock_image)

        @image_manager = SlickRubyGame::ContentMgmt::ImageManager.instance
        @image_manager.instance_variable_set(:@image_factory, @mock_factory)
    end

    it 'should be a singleton' do
        expect(@image_manager).to be SlickRubyGame::ContentMgmt::ImageManager.instance
    end

    describe '#initialize' do
        it 'should have an empty map of images' do
            expect(@image_manager.images).to be_empty
        end
    end

    describe '#retrieve' do

        it 'should return an image with the given filename' do
            file_name = '/home/arthur/Projects/SlickRubyGameEngine/spec/res/test.png'
            image = @image_manager.retrieve(file_name)

            expect(image).to be @mock_image
            expect(@image_manager.images[file_name]).to be @mock_image
        end

        it 'should return the stored image for an already loaded file' do
            file_name = 'some/file'
            stored_image = double('stored image')
            @image_manager.images[file_name] = stored_image

            expect(@image_manager.retrieve(file_name)).to be stored_image
        end

    end

    describe '#retrieve_sprite_sheet' do
    end

    describe '#clear' do
    end
    
end
