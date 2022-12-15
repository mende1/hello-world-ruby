class Hero
  attr_accessor :line, :column

  def define_new_player_position(direction)
    
    movements = {
      "W" => [-1, 0],
      "S" => [1, 0],
      "A" => [0, -1],
      "D" => [0, 1],
    }
    movement = movements[direction]
    
    hero = dup
    hero.line += movement[0]
    hero.column += movement[1]
    
    hero
  end

  def to_array
    [line, column]
  end

  def self_remove(map)
    map[line][column] = " "
  end

  def self_add(map)
    map[line][column] = "H"
  end
end