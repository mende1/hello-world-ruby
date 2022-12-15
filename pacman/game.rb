require_relative 'ui'

def start_game
  name = welcome
  play name
end

def game_over
  puts "\n\n\n\n\n\n"
  puts "Game Over"
end

def read_map(number)
  file = "pacman/map#{number}.txt"
  text = File.read(file)
  map = text.split("\n")
end

def copy_map(map)
  new_map = map.join("\n").tr("F", " ").split("\n")
end

def find_player(map)
  hero = "H"

  map.each_with_index do |current_line, line|
    hero_column = current_line.index hero

    if hero_column
      return [line, hero_column]
    end
  end

  nil
end

def define_new_player_position(hero, direction)
  hero = hero.dup
  movements = {
    "W" => [-1, 0],
    "S" => [1, 0],
    "A" => [0, -1],
    "D" => [0, 1],
  }
  movement = movements[direction]
  hero[0] += movement[0]
  hero[1] += movement[1]
  hero
end

def is_valid_position?(map, position)
  lines = map.size
  columns = map[0].size

  overflow_line = position[0] < 0 || position[0] >= lines
  overflow_column = position[1] < 0 || position[1] >= columns

  if overflow_line || overflow_column
    return false
  end

  position_value = map[position[0]][position[1]]

  if position_value == "X" || position_value == "F"
    return false
  end

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

    if is_valid_position?(map, new_position) && is_valid_position?(new_map, new_position)
      valid_positions << new_position
    end
  end

  valid_positions
end

def move_ghosts(map)
  ghost = "F"
  new_map = copy_map map

  map.each_with_index do |current_line, line|
    current_line.chars.each_with_index do |character, column|
      is_ghost = character == ghost
      if is_ghost
        move_ghost map, new_map, line, column
      end
    end
  end

  new_map
end

def move_ghost(map, new_map, line, column)
  valid_positions = find_valid_positions map, new_map, [line, column]
  if valid_positions.empty?
    return
  end

  rand_position = rand valid_positions.size
  position = valid_positions[rand_position]
  
  map[line][column] = " "
  new_map[position[0]][position[1]] = "F"
end

def player_loses?(map)
  loses = !find_player(map)
end

def play(name)
  map = read_map(2)
  while true
    draw map
    direction = ask_for_direction.upcase
    hero = find_player map
    
    new_position = define_new_player_position hero, direction

    if !is_valid_position? map, new_position
      next
    end
    
    map[hero[0]][hero[1]] = " "
    map[new_position[0]][new_position[1]] = "H"

    map = move_ghosts map

    if player_loses? map
      game_over
      break
    end
  end
end