# frozen_string_literal: true

def welcome
	puts 'What is your name?'
	
	name = gets.strip
	
	puts "\nWelcome, #{name}, to the Gessing Game!"
	puts "Choose a number between 0 and 200:"
end


def get_secret_number
	rand 200
end


def ask_a_number(tries, attempt)
	puts "\nYou already try: #{tries.to_s}"
	puts "Attempt ##{attempt.to_s}:"
	
	number = gets.strip

	number.to_i
end


def check_equality (secret, guess)
	equals = guess == secret

	puts

	if equals
		puts 'You got this!'
		return true
	end

	greater = guess > secret
	if guess > secret
		puts 'The secret number are lesser'
	else
		puts 'The secret number are greater'
	end
	false
end


limit = 5

welcome
secret = get_secret_number

tries = []

total_points = 1000

for round in 1..limit
	guess = ask_a_number tries, round

	total_points -= (secret - guess).abs / 2.0

	tries << guess
	
	break if check_equality secret, guess
end

puts "Total #{total_points} points!"
