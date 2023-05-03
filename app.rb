require_relative './classes/game'
require_relative './classes/author'
require_relative './list_data'
require_relative './classes/item'
require_relative './classes/storage/game_storage'
require_relative './classes/storage/author_storage'

class App
  def initialize
    @games = GameStorage.fetch
    @authors = AuthorStorage.fetch
  end

  def welcome
    'Welcome to the app'
  end

  def list_games
    if @games.empty?
      puts "There are no games\n\n"
    else
      puts "\n\nGames:\n"
      @games.each do |game|
        puts "#{game.name} #{game.multiplayer} #{game.last_played_at} (#{game.publish_date.year})\n"
      end
    end
    puts
  end

  def list_authors
    if @authors.empty?
      puts "There are no authors\n\n"
    else
      puts "\n\List of Authors:\n"
      @authors.each do |author|
        puts "#{author.first_name} #{author.last_name}\n"
      end
    end
    puts
  end

  def add_game
    puts 'What is the name of the game?'
    game_name = gets.chomp

    puts 'Is the game multiplayer? (y/n)'
    multiplayer = gets.chomp.downcase

    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp

    puts 'What is the last played at date? (YYYY-MM-DD)'
    last_played_date = gets.chomp

    new_game = Game.new(game_name, multiplayer, last_played_date, publish_date)
    @games << new_game

    puts 'Who is the author of the game? (e.g. Stephen King.)'
    puts 'First Name: '
    author_first_name = gets.chomp

    puts 'Last Name: '
    author_last_name = gets.chomp

    author = @authors.find do |author_temp|
      author_temp.first_name == author_first_name && author_temp.last_name == author_last_name
    end
    return unless author.nil?

    author = Author.new(author_first_name, author_last_name)
    @authors << author

    new_game.add_author(author)
  end

  def quit
    GameStorage.store(@games)
    AuthorStorage.store(@authors)
  end

  def run
    puts welcome
    loop do
      list_options
      choice = gets.chomp

      case choice
      when '2'
        list_games
      when '3'
        list_authors
      when '4'
        add_game
      when '5', 'q', 'Q'
        quit
        break
      end
    end
  end
end
