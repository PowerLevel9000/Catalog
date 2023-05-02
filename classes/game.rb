require_relative 'item'

class Game < Item
  attr_accessor :name, :multiplayer, :last_played_at, :publish_date, :id

  def initialize(name, multiplayer, last_played_at, publish_date, id = Random.rand(1..1000))
    super(publish_date)
    @id = id
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @items = []
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at.to_s).year > 2)
  end
end
