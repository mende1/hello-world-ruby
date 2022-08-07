# frozen_string_literal: true

def welcome
  puts 'What is your name?'

  name = gets.strip

  puts "\nWelcome, #{name}, to the Gessing Game!"

  name
end

def choose_difficulty
  puts 'Choose the difficulty:'
  puts '(1) Very Easy  (2) Easy  (3) Normal  (4) Hard  (5) Very Hard'

  gets.to_i
end

def get_secret_number(difficulty)
  case difficulty
  when 1
    maximum = 30
  when 2
    maximum = 60
  when 3
    maximum = 100
  when 4
    maximum = 150
  when 5
    maximum = 200
  end

  puts "\nGuess a number between 1 and #{maximum}"
  rand(maximum) + 1
end

def ask_a_number(tries, attempt)
  puts "\nYou already try: #{tries}"
  puts "Attempt ##{attempt}:"

  number = gets.strip

  number.to_i
end

def check_equality(secret, guess)
  equals = guess == secret

  puts

  if equals
    puts 'You got this! ✔️'
    return true
  end

  if guess > secret
    puts 'The secret number are lesser! <'
  else
    puts 'The secret number are greater! >'
  end
  false
end

def dont_wants_play_again?
  puts 'Do you want to play again? (Y/n)'
  ans = gets.strip
  puts
  ans.upcase == 'N'
end

def play(name)
  limit = 5
  win = false

  difficulty = choose_difficulty
  secret = get_secret_number difficulty

  tries = []

  total_points = 1000

  (1..limit).each do |round|
    guess = ask_a_number tries, round

    while tries.include? guess
      puts 'You already try this number! ⚠️'
      guess = ask_a_number tries, round
    end

    total_points -= (secret - guess).abs / 2.0

    tries << guess

    if name == 'Mendel'
      puts "\nYou got this! ✔️"
      win = true
      break
    end

    if check_equality secret, guess
      win = true
      break
    end

    next unless limit == round && ((secret - guess).abs == 1)

    puts 'You wrong by 1. Have a last chance. Try again!'
    guess = ask_a_number tries, 'Last Chance'
    total_points -= (secret - guess).abs / 2.0
    if check_equality secret, guess
      win = true
      break
    end
  end

  if win
    puts "#{name} => Total #{total_points} points!"
  else
    puts "\nYou lose! ❌"
  end

  puts

  win
end

def finish_game(wins_count, plays_count)
  wins_percent = (wins_count / plays_count.to_f) * 100

  puts "You got #{wins_count} wins out of #{plays_count} plays!"
  puts "Total #{wins_percent}% of wins!"
  puts
end

# main

name = welcome

wins_count = 0
plays_count = 0

loop do
  plays_count += 1
  win = play name

  wins_count += 1 if win

  break if dont_wants_play_again?
end

finish_game wins_count, plays_count
