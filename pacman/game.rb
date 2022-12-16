require_relative 'ui'
require_relative 'hero'

def start_game
  name = welcome
  play name
end

def read_map(number)
  file = "pacman/map#{number}.txt"
  text = File.read(file)
  text.split("\n")
end

def copy_map(map)
  map.join("\n").tr('F', ' ').split("\n")
end

def find_player(map)
  hero = 'H'

  map.each_with_index do |current_line, line|
    hero_column = current_line.index hero

    next unless hero_column

    hero = Hero.new
    hero.line = line
    hero.column = hero_column

    return hero
  end

  nil
end

def is_valid_position?(map, position)
  lines = map.size
  columns = map[0].size

  overflow_line = position[0].negative? || position[0] >= lines
  overflow_column = position[1].negative? || position[1] >= columns

  return false if overflow_line || overflow_column

  position_value = map[position[0]][position[1]]

  return false if %w[X F].include?(position_value)

  true
end

def sum_arrays(arr1, arr2)
  [arr1[0] + arr2[0], arr1[1] + arr2[1]]
end

def find_valid_positions(map, new_map, position)
  valid_positions = []

  moviments = [[+1, 0], [-1, 0], [0, +1], [0, -1]]

  moviments.each do |moviment|
    new_position = sum_arrays position, moviment

    valid_positions << new_position if valid_position?(map, new_position) && valid_position?(new_map, new_position)
  end

  valid_positions
end

def move_ghosts(map)
  ghost = 'F'
  new_map = copy_map map

  map.each_with_index do |current_line, line|
    current_line.chars.each_with_index do |character, column|
      is_ghost = character == ghost
      move_ghost map, new_map, line, column if is_ghost
    end
  end

  new_map
end

def move_ghost(map, new_map, line, column)
  valid_positions = find_valid_positions map, new_map, [line, column]
  return if valid_positions.empty?

  rand_position = rand valid_positions.size
  position = valid_positions[rand_position]

  map[line][column] = ' '
  new_map[position[0]][position[1]] = 'F'
end

def player_loses?(map)
  !find_player(map)
end

def play(_name)
  map = read_map(2)
  Kernel.loop do
    draw map
    direction = ask_for_direction.upcase

    hero = find_player map
    new_position = hero.define_new_player_position direction

    next unless valid_position? map, new_position.to_array

    hero.self_remove map
    new_position.self_add map

    map = move_ghosts map

    if player_loses? map
      game_over
      break
    end
  end
end
