require 'date'

class Item
  attr_reader :archived, :publish_date, :author

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def add_author(author)
    @author = author
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today - @publish_date).to_i > 3652
  end
end
