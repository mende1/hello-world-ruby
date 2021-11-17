# frozen_string_literal: true

def welcome
    puts
    puts "Welcome to Hangman Game!"
    puts "What is your name?"
    name = gets.strip

    puts "\n"
    puts "Lets start, #{name}"

    name
end

def choose_secret_word
    puts "Choosing a word..."

    secret_word = "programador"
    puts "Choosed word with #{secret_word.size} letters... Good luck!"
    puts "\n\n"

    secret_word
end


def dont_wants_play_again?
	puts "Do you want to play again? (Y/n)"
	answer = gets.strip
	puts
	dont_wants = answer.upcase == "N"
end


def ask_a_try (errors, tries)
    puts
    puts "Total of errors: #{errors}"
    puts "You already try: #{tries.to_s}"
    puts "\nEnter with a word or a letter: "
    
    input = gets.strip
end


def play (name)
    secret_word = choose_secret_word

    errors = 0
    tries = []
    total_points = 0

    while errors < 5
        try = ask_a_try errors, tries

        if tries.include? try
            puts "\nYou already try this one! ⚠️"
            next
        end

        tries << try

        tried_only_one_letter = try.size == 1
        if tried_only_one_letter
            
            letter_count = secret_word.count try
            
            if letter_count == 0
                puts "\nLetter not found! ⚠️"
                errors += 1
            else
                puts "\nLetter found #{letter_count} times! ✔️"
            end
        else
            correct = try == secret_word
            if correct
                total_points += 100
                puts "\nCongratulations! You got this! ✔️🎉🥳🎈✔️"
                break
            else
                total_points -= 30
                puts "\nYou missed! ❌"
                errors += 1
            end
        end
    end

    puts "#{name} => Total #{total_points} points!"
    puts
end


# main

name = welcome

loop do
    play name

    break if dont_wants_play_again?
end
