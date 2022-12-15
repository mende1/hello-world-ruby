def welcome
  puts "Welcome to Pacman!"
  puts "What is your name?"
  name = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{name}"
  name
end

def game_over
  puts "\n\n\n\n\n\n"
  puts "Game Over"
end

def ask_for_direction
  puts "Where do you want to go?"
  direction = gets.strip
end

def draw(map)
  puts map
end