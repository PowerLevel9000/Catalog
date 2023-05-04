require_relative 'json_read_write'

class Things
  include JsonReadWrite
  attr_reader :music_albums, :genres, :books, :labels, :authors, :games

  def initialize
    @music_albums = json_read('./data/music_album.json') || []
    @books = json_read('./data/book.json') || []
    @labels = json_read('./data/label.json') || []
    @genres = json_read('./data/genre.json') || []
    @authors = json_read('./data/authors.json') || []
    @games = json_read('./data/games.json') || []
  end

  def add_music_album(music_album)
    @music_albums << music_album unless @music_albums.include?(music_album)
    json_music_album =
      {
        on_spotify: music_album.on_spotify,
        name: music_album.genre.name,
        publish_date: music_album.publish_date,
        id: music_album.id,
        title: music_album.label.title,
        color: music_album.label.color,
        first_name: music_album.author.first_name,
        last_name: music_album.author.last_name
      }
    json_write('./data/music_album.json', json_music_album)
  end

  def add_genre(genre)
    @genres << genre unless @genres.include?(genre)
    json_genre =
      {
        name: genre.name,
        id: genre.id
      }
    json_write('./data/genre.json', json_genre)
  end

  def add_label(label)
    @labels << label unless @labels.include?(label)
    json_label =
      {
        title: label.title,
        id: label.id,
        color: label.color
      }
    json_write('./data/label.json', json_label)
  end

  def add_author(author)
    @authors << author unless @authors.include?(author)
    json_author =
      {
        first_name: author.first_name,
        last_name: author.last_name,
        id: author.id
      }
    json_write('./data/authors.json', json_author)
  end

  def add_book(book)
    @books << book unless @books.include?(book)
    json_book =
      {
        id: book.id,
        publish_date: book.publish_date,
        cover_state: book.cover_state,
        publisher: book.publisher,
        name: book.genre.name,
        title: book.label.title,
        first_name: book.author.first_name,
        last_name: book.author.last_name
      }
    json_write('./data/book.json', json_book)
  end

  def add_game(game)
    @games << game unless @games.include?(game)
    json_game =
      {
        id: game.id,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        name: game.genre.name,
        title: game.label.title,
        color: game.label.color,
        first_name: game.author.first_name,
        last_name: game.author.last_name
      }
    json_write('./data/games.json', json_game)
  end
end
