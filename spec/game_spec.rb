require 'date'
require 'spec_helper'

describe Game do
  context 'When instantiated' do
    game = Game.new('pokemon', 'y', '2023-04-26', '2010-01-24', 27)
    it 'Game should be instantiated successfully' do
      expect(game.name).to eq 'pokemon'
    end

    it 'adds correct author names' do
      game = Game.new('pokemon', 'y', '2023-04-26', '2010-01-24', 27)
      game.add_author(Author.new('Leslie', 'Studios'))
      expect(game.author.first_name).to eq 'Leslie'
    end
  end

  it 'Checks whether game can be archived' do
    item = Item.new('2010-01-01')
    game = Game.new('pokemon', 'y', '2023-04-26', '2010-01-24', 27)
    expect(game.archived).to be(false)
  end
end