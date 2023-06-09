require_relative 'item'

class Game < Item
  attr_accessor :name, :multiplayer, :last_played_at

  def initialize(name, multiplayer, last_played_at, publish_date)
    super(publish_date)
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
