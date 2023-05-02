def list_options
  puts 'What would you like to do?'
  puts '2. List all games'
  puts '3. List all authors'
  puts '4. Add a new game'
  puts '5. Exit'
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
    puts "\n\nList of Authors:\n"
    @authors.each do |author|
      puts "#{author.first_name} #{author.last_name}\n"
    end
  end
  puts
end
