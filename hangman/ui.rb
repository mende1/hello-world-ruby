# frozen_string_literal: true

def welcome
  puts
  puts 'Welcome to Hangman Game!'
  puts 'What is your name?'
  name = gets.strip

  puts "\n"
  puts "Lets start, #{name}"

  name
end

def print_forca(errors)
  head = '   '
  body = ' '
  legs = '   '
  arms = '   '

  errors >= 1 && head = '(_)'

  if errors >= 2
    arms = ' | '
    body = ' | '
  end

  errors >= 3 && arms = '\\|/'

  errors >= 4 && legs = '/ \\'

  puts '  _______       '
  puts ' |/      |      '
  puts " |      #{head}       "
  puts " |      #{arms}       "
  puts " |      #{body}       "
  puts " |      #{legs}       "
  puts ' |              '
  puts '_|_             '
  puts
end

def header_tries(errors, tries, mask)
  puts
  print_forca errors
  puts "Secret word: #{mask}"
  puts
  puts "Total of errors: #{errors}"
  puts "You already try: #{tries}"
end

def dont_wants_play_again?
  puts 'Do you want to play again? (Y/n)'
  answer = gets.strip
  puts
  answer.upcase == 'N'
end

def ask_a_try
  puts "\nEnter with a word or a letter: "

  gets.strip.downcase
end

def warn_choosing_a_word
  puts 'Choosing a word...'
end

def warn_choosed_secret_word(secret_word)
  puts "Choosed word with #{secret_word.size} letters... Good luck!"
  puts "\n\n"
end

def warn_repeated_try
  puts "\nYou already try this one! ⚠️"
end

def warn_letter_not_found
  puts "\nLetter not found! ⚠"
end

def warn_letter_found(letter_count)
  puts "\nLetter found #{letter_count} times! ✔️"
end

def warn_word_right
  puts "\nCongratulations! You got this!"
end

def warn_word_wrong
  puts "\nYou missed! ❌"
end

def show_points(name, points)
  puts "#{name} => #{points} points!"
  puts
end

def show_total_points(name, total_points)
  puts "Total points (#{name}) => #{total_points} points"
end

def show_current_champion(data)
  puts "Our current Champion is #{data[0]} with #{data[1]} points!\n\n"
end
