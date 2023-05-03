require_relative './storage'

class GameStorage < Storage
  @games = []

  class << self
    attr_accessor :games
  end

  def self.fetch
    games = if File.exist?('./data/games.json')
              JSON.parse(File.read('./data/games.json'))
            else
              []
            end
    games.map { |game| deserialize(game) }
  end

  def self.store(games)
    games.each do |game|
      @games << serialize(game)
    end

    File.write('./data/games.json', JSON.pretty_generate(@games))
  end

  def self.serialize(game)
    {
      name: game.name,
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at,
      publish_date: game.publish_date,
      id: game.id
    }
  end

  def self.deserialize(game)
    Game.new(game['name'], game['multiplayer'], game['last_played_at'], game['publish_date'], game['id'])
  end
end
