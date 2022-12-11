# frozen_string_literal: true

def save_points_of_player(name, points)
  content = "#{name}\n#{points}\n"
  File.write 'hangman/rank.txt', content
end

def read_current_champion_data
  current_data = File.read 'hangman/rank.txt'

  current_data.split("\n")
end
