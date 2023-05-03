require_relative './storage'

class AuthorStorage < Storage
  @authors = []

  class << self
    attr_accessor :authors
  end

  def self.fetch
    authors = if File.exist?('./data/authors.json')
                JSON.parse(File.read('./data/authors.json'))
              else
                []
              end
    authors.map { |author| deserialize(author) }
  end

  def self.store(authors)
    authors.each do |author|
      @authors << serialize(author)
    end

    File.write('./data/authors.json', JSON.pretty_generate(@authors))
  end

  def self.serialize(author)
    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end

  def self.deserialize(author)
    Author.new(author['first_name'], author['last_name'], author['id'])
  end
end
