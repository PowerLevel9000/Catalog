# require_relative './classes/game'
# require_relative './classes/author'
# require_relative './list_data'
# require_relative './classes/item'
# require_relative './classes/storage/game_storage'
# require_relative './classes/storage/author_storage'


require_relative './classes/author'
require_relative './classes/book'
require_relative './classes/game'
require_relative './classes/item'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'
require 'date'


class App
  def initialize(things)
    @things = things
  end

  def list_music_albums
    count = 0
    puts 'Avaible music albums are:'
    @things.music_albums.each do |music_album|
      puts "#{count})This music album is in " \
           "#{music_album.genre.name} genre, and published " \
           "at #{music_album.publish_date} which is " \
           "#{music_album.on_spotify ? 'available' : 'not available'} on the Spotify."
      count += 1
    end
  end

  def create_music_album
    music_album = add_music_album
    genre = create_genre
    label = create_label
    author = create_author
    music_album.add_genre(genre)
    music_album.add_author(author)
    music_album.add_label(label)
    @things.add_music_album(music_album)
    puts 'Music album added successfully!'
  end

  def create_book
    puts 'to create book please enter the following information:'
    print "Enter book's published date(format: YYYY/MM/DD): "
    publish_date = Date.parse(gets.chomp)
    print "Enter book's name: "
    title = gets.chomp
    print "Enter book's publisher: "
    publisher = gets.chomp
    print "Enter book's cover state: "
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    book.add_author(create_author)
    book.add_label(create_label)
    book.add_genre(create_genre)
    @things.add_book(book)
    puts 'Book added successfully!'
  end

  def list_books
    puts 'Avaible books are:'
    @counter = 1
    @things.books.each do |book|
      puts "#{@counter}) This book is in #{book.genre.name} genre, by #{book.author.first_name} #{book.author.last_name}. published at #{book.publish_date} and has #{book.cover_state} cover state."
      @counter += 1
    end
  end

  def create_game
    puts 'to create game please enter the following information:'
    print "Enter game's name: "
    name= gets.chomp
    print "Enter game's published date(format: YYYY/MM/DD): "
    published_date = Date.parse(gets.chomp)
    print 'Enter game multiplayer mode:[true/false] '
    multiplayer = gets.chomp.to_s
    multiplayer = multiplayer == 'true'
    print "Enter game's last played date(format: YYYY/MM/DD): "
    last_played_at = Date.parse(gets.chomp)
    game = Game.new(name, published_date, multiplayer, last_played_at)
    game.add_author(create_author)
    game.add_label(create_label)
    game.add_genre(create_genre)
    @things.add_game(game)
    puts 'Game added successfully!'
  end

  def list_games
    @counter = 1
    puts 'Avaible games are:'
    @things.games.each do |game|
      puts "#{@counter}) This game is in #{game.name} genre and published at #{game.publish_date} and multiplayer mode  #{game.multiplayer} ."
      @counter += 1
    end
  end

  def list_labels
    puts 'Avaible labels are:'
    count = 0
    @things.labels.each do |label|
      puts "#{count}) [Label] Tiltle:  #{label.title}, Color: #{label.color}"
      count += 1
    end
  end


  def list_genres
    @counter = 1
    puts 'Avaible genres are:'
    @things.genres.each do |genre|
      puts "#{@counter}) [Genre] name: #{genre.name}"
      @counter += 1
    end
  end

  def list_authors
    puts 'Avaible Authors are:'
    count = 0
    @things.authors.each do |author|
      puts "#{count}) [Author] First name:  #{author.first_name}, Last name: #{author.last_name}"
      count += 1
    end
  end

  private

  def add_music_album
    print 'Does music album avaible on the spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase == 'y'
    puts "Enter music album's published date(format: YYYY/MM/DD): "
    published_date = Date.parse(gets.chomp)
    MusicAlbum.new(on_spotify, published_date)
  end

  def create_genre
    print 'Enter genre: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @things.add_genre(genre)
    genre
  end


  def create_author
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @things.add_author(author)
    author
  end

  def create_label
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    label = Label.new(title, color)
    @things.add_label(label)
    label
  end
end

# require_relative './classes/game'
# require_relative './classes/author'
# require_relative './list_data'
# require_relative './classes/item'
# require_relative './classes/storage/game_storage'
# require_relative './classes/storage/author_storage'

# class App
#   def initialize
#     @games = GameStorage.fetch
#     @authors = AuthorStorage.fetch
#   end

#   def welcome
#     'Welcome to the app'
#   end

#   def list_games
#     if @games.empty?
#       puts "There are no games\n\n"
#     else
#       puts "\n\nGames:\n"
#       @games.each do |game|
#         puts "#{game.name} #{game.multiplayer} #{game.last_played_at} (#{game.publish_date.year})\n"
#       end
#     end
#     puts
#   end

#   def list_authors
#     if @authors.empty?
#       puts "There are no authors\n\n"
#     else
#       puts "\n\List of Authors:\n"
#       @authors.each do |author|
#         puts "#{author.first_name} #{author.last_name}\n"
#       end
#     end
#     puts
#   end

#   def add_game
#     puts 'What is the name of the game?'
#     game_name = gets.chomp

#     puts 'Is the game multiplayer? (y/n)'
#     multiplayer = gets.chomp.downcase

#     puts 'What is the publish date? (YYYY-MM-DD)'
#     publish_date = gets.chomp

#     puts 'What is the last played at date? (YYYY-MM-DD)'
#     last_played_date = gets.chomp

#     new_game = Game.new(game_name, multiplayer, last_played_date, publish_date)
#     @games << new_game

#     puts 'Who is the author of the game? (e.g. Stephen King.)'
#     puts 'First Name: '
#     author_first_name = gets.chomp

#     puts 'Last Name: '
#     author_last_name = gets.chomp

#     author = @authors.find do |author_temp|
#       author_temp.first_name == author_first_name && author_temp.last_name == author_last_name
#     end
#     return unless author.nil?

#     author = Author.new(author_first_name, author_last_name)
#     @authors << author

#     new_game.add_author(author)
#   end

#   def quit
#     GameStorage.store(@games)
#     AuthorStorage.store(@authors)
#   end

#   def run
#     puts welcome
#     loop do
#       list_options
#       choice = gets.chomp

#       case choice
#       when '2'
#         list_games
#       when '3'
#         list_authors
#       when '4'
#         add_game
#       when '5', 'q', 'Q'
#         quit
#         break
#       end
#     end
#   end
# end
