require 'date'

class Item
  attr_reader :id, :publish_date, :archived, :genre

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end

  private

  def can_be_archived?
    (Time.now.year - Date.parse(@publish_date).year) > 10
  end
end
