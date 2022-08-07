# frozen_string_literal: true

require_relative 'ui'

def ask_a_valid_try(errors, tries, mask)
  header_tries errors, tries, mask
  loop do
    try = ask_a_try

    return try unless tries.include? try

    warn_repeated_try
  end
end

def get_masked_word(tries, secret_word)
  mask = ''
  secret_word.chars.each do |letter|
    mask += if tries.include? letter
              letter
            else
              '_'
            end
    mask += ' '
  end
  mask
end

def choose_secret_word
  warn_choosing_a_word

  text = File.read('words.txt')
  words = text.split("\n")

  random_number = rand(words.size)
  secret_word = words[random_number].downcase

  warn_choosed_secret_word secret_word

  secret_word
end

def play(name)
  secret_word = choose_secret_word

  errors = 0
  tries = []
  total_points = 0

  while errors < 5
    mask = get_masked_word tries, secret_word
    try = ask_a_valid_try errors, tries, mask

    if tries.include? try
      warn_repeated_try
      next
    end

    tries << try

    tried_only_one_letter = try.size == 1
    if tried_only_one_letter
      letter_count = secret_word.count try

      if letter_count.zero?
        warn_letter_not_found
        errors += 1
      else
        warn_letter_found letter_count
      end
    else
      correct = try == secret_word
      if correct
        total_points += 100
        warn_word_right
        break
      else
        total_points -= 30
        warn_word_wrong
        errors += 1
      end
    end
  end

  show_points name, total_points
end

def hangman_play
  name = welcome

  loop do
    play name

    break if dont_wants_play_again?
  end
end
