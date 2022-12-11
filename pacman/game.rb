require_relative 'ui'

def start_game
  name = welcome
  play name
end

def read_map(number)
  file = "pacman/map#{number}.txt"
  text = File.read(file)
  map = text.split("\n")
end

def find_player(map)
  hero = "H"

  map.each_with_index do |current_line, line|
    hero_column = current_line.index hero

    if hero_column
      return [line, hero_column]
    end
  end
end

def define_new_player_position(hero, direction)
  hero = hero.dup
  case direction
    when "W"
      hero[0] -= 1
    when "S"
      hero[0] += 1
    when "A"
      hero[1] -= 1
    when "D"
      hero[1] += 1
  end
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

  if map[position[0]][position[1]] == "X"
    return false
  end

  true
end

def play(name)
  map = read_map(1)
  while true
    draw map
    direction = ask_for_direction
    hero = find_player map
    
    new_position = define_new_player_position hero, direction

    if !is_valid_position? map, new_position
      next
    end
    
    map[hero[0]][hero[1]] = " "
    map[new_position[0]][new_position[1]] = "H"
  end
end