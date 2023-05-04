class Menu
    MENU_OPTIONS = {
      '1' => :create_music_album,
      '2' => :create_book,
      '3' => :create_game,
      '4' => :list_books,
      '5' => :list_games,
      '6' => :list_music_albums,
      '7' => :list_genres,
      '8' => :list_authors,
      '9' => :list_labels,
      '10' => :exit
    }.freeze
  
    def initialize(app)
      @app = app
    end
  
    def show
      loop do
        print_menu_options
  
        choice = menu_choice
  
        if MENU_OPTIONS.include?(choice) # If the key is present
          method_name = MENU_OPTIONS[choice] # get value
          exit if method_name == :exit
  
          @app.send(method_name)
        else
          puts 'Invalid input. Please try again.'
        end
      end
    end
  
    private
  
    def print_menu_options
      puts "\nPlease choose an option by entering a number:"
      MENU_OPTIONS.each do |key, value|
        puts "#{key} - #{value.to_s.gsub('_', ' ')}" # replace underscores with spaces in the value string
      end
    end
  
    def menu_choice
      gets.chomp.downcase
    end
  end
