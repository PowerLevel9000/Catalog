require_relative '../modules/genre'
require_relative '../modules/item'

describe Genre do
  before :each do
    @genre = Genre.new('romance')
  end

  context 'Genre should be an instance of Genre class' do
    it 'returns true' do
      expect(@genre).to be_an_instance_of(Genre)
    end
  end

  context 'Item of Genre should be an instance of Item class' do
    it 'returns true' do
      @item = Item.new('2000-10-2')
      @item.add_genre(@genre)
      expect(@genre.items).to include(@item)
    end
  end
end
