require_relative 'item'

class Book < Item
  attr_accessor :publisher, :id
  attr_reader :cover_state

  def initialize(publisher, cover_state)
    super(publish_date)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  private # just for testing  comment it out

  def can_be_archived?
    super || cover_state == 'bad' ? true : false
  end
end

# book1 =  Book.new("CCC", "bad")
# puts book1.can_be_archived?
# book2 =  Book.new("CCC", "good")
# puts book2.can_be_archived?
