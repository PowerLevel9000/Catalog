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
    return empty if @things.music_albums.empty?

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

  def empty
    puts 'Nothing at the moment'
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
    begin
      publish_date = Date.parse(gets.chomp)
    rescue StandardError
      puts 'invalid input try again'
      create_book
    end
    print "Enter book's publisher: "
    publisher = gets.chomp
    print "Enter book's cover state: "
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    book.add_author(create_author)
    book.add_label(create_label)
    book.add_genre(create_genre)
    @things.add_book(book)
    puts 'Book added successfully!'
  end

  def list_books
    return empty if @things.books.empty?

    puts 'Avaible books are:'
    @counter = 1
    @things.books.each do |book|
      puts "#{@counter}) This book is #{book.label.title}, by #{book.author.first_name} #{book.author.last_name} and has #{book.cover_state} cover state."
      @counter += 1
    end
  end

  def create_game
    puts 'to create game please enter the following information:'
    print "Enter game's name: "
    name = gets.chomp
    print "Enter game's published date(format: YYYY/MM/DD): "
    begin
      published_date = Date.parse(gets.chomp)
    rescue StandardError
      puts 'invalid input try again'
      create_game
    end

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
    return empty if @things.games.empty?

    @counter = 1
    puts 'Avaible games are:'
    @things.games.each do |game|
      puts "#{@counter}) This game is in #{game.name} genre and published at #{game.publish_date} and multiplayer mode  #{game.multiplayer} ."
      @counter += 1
    end
  end

  def list_labels
    return empty if @things.labels.empty?

    puts 'Avaible labels are:'
    count = 0
    @things.labels.each do |label|
      puts "#{count}) [Label] Tiltle:  #{label.title}, Color: #{label.color}"
      count += 1
    end
  end

  def list_genres
    return empty if @things.genres.empty?

    @counter = 1
    puts 'Avaible genres are:'
    @things.genres.each do |genre|
      puts "#{@counter}) [Genre] name: #{genre.name}"
      @counter += 1
    end
  end

  def list_authors
    return empty if @things.authors.empty?

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
    begin
      published_date = Date.parse(gets.chomp)
    rescue StandardError
      puts 'invaild input try again'
      add_music_album
    end
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
