def find_spaceship(map)

  return "Spaceship lost forever." if !map.include?('X')
  coord_map = []
  x_coord = [0, 0]
  map.split("\n").each { |row| coord_map << row.split("") }

  coord_map.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      if column == 'X'
        x_coord[0] = column_index
        x_coord[1] = coord_map.length - row_index - 1
      end
    end
  end

  x_coord

end

=begin

def find_spaceship(map)
  map.split("\n").reverse_each.with_index { |line, y|
    x = line.index("X")
    return [x, y] if x
  }
  "Spaceship lost forever."
end

def find_spaceship(map)
  coords = 'Spaceship lost forever.'
  map.lines().each_with_index do |line, index|
    next unless line.include? 'X'
    coords = [line.index('X'), map.lines().size - index - 1]
  end
  coords
end

=end
