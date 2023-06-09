require 'date'
require 'spec_helper'

describe Game do
  context 'When instantiated' do
    game = Game.new('pokemon', 'y', '2023-04-26', '2010-01-24')
    it 'Game should be instantiated successfully' do
      expect(game.name).to eq 'pokemon'
    end

    it 'adds correct author names' do
      game = Game.new('pokemon', 'y', '2023-04-26', '2010-01-24')
      game.add_author(Author.new('Leslie', 'Studios'))
      expect(game.author.first_name).to eq 'Leslie'
    end
  end

  it 'Checks whether game can be archived' do
    game = Game.new('pokemon', 'y', '2023-04-26', '2010-01-24')
    expect(game.archived).to be(false)
  end
end
