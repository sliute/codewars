=begin

Your task, is to create a NxN spiral with a given size.
For example, spiral with size 5 should look like this:

00000
....0
000.0
0...0
00000

General rule-of-a-thumb is, that the snake made with '1' cannot touch to itself.
https://www.codewars.com/kata/534e01fbbb17187c7e0000c6/train/ruby

#require 'matrix'

#class Matrix
#  def []=(i, j, x)
#    @rows[i][j] = x
#  end
#end

#def spiralize(size)
#
#  size_matrix = Matrix.zero(size)
#
#  return [[1]] if size == 1
#  ...

=end

def spiralize(size)

  return [] if size == 0
  return [[1]] if size == 1
  return [[1, 1], [0, 1]] if size == 2

  size_matrix = Array.new(size) { Array.new(size, 0) }

  rights = 0
  downs = 0
  lefts = 0
  ups = 0

  curr_row = 0
  curr_col = 0

  while true

    #going right
    until curr_col > size - 1 - 2*downs
      size_matrix[curr_row][curr_col] = 1
      curr_col += 1
    end

    rights += 1
    curr_col -= 1
    curr_row += 1
    return size_matrix if size_matrix[curr_row + 1][curr_col] == 1

    #going down
    until curr_row > size - 1 - 2*lefts
      size_matrix[curr_row][curr_col] = 1
      curr_row += 1
    end

    downs += 1
    curr_row -= 1
    curr_col -= 1
    return size_matrix if size_matrix[curr_row - 1][curr_col] == 1

    #going left
    until curr_col < 2*ups
      size_matrix[curr_row][curr_col] = 1
      curr_col -= 1
    end

    lefts += 1
    curr_col += 1
    curr_row -= 1
    return size_matrix if size_matrix[curr_row - 1][curr_col] == 1

    #going up
    until curr_row < 2*rights
      size_matrix[curr_row][curr_col] = 1
      curr_row -= 1
    end

    ups += 1
    curr_row += 1
    curr_col += 1
    return size_matrix if size_matrix[curr_row + 1][curr_col] == 1

  end

end

=begin

def spiralize(size)
  return [] if size == 0
  return [[1]] if size == 1
  return [[1,1],[0,1]] if size == 2
  add_layer(spiralize(size-2))
end

def add_layer(square)
  2.times { square = add_rows(rotate(square)) }
  square
 end

def rotate(square)
  square.reverse.transpose
end

def add_rows(array)
  row_length = array.first.count
  array.unshift(Array.new(row_length -1 ,0)+ [1])
  array.unshift(Array.new(row_length, 1))
end


def draw(x, y, array, dir_x, dir_y, flag, turn)
  return true if turn == array.size
  array[x][y] = 1
  if  x+dir_x > array.size-1 or
      y+dir_y > array.size-1 or
      x+dir_x < 0 or
      y+dir_y < 0 or
      (array[x+dir_x*2] != nil and
       x+dir_x*2 >= 0 and y+dir_y*2 >= 0 and
       array[x+dir_x*2][y+dir_y*2] == 1)
    flag = -flag
    turn += 1
    dir_x, dir_y = dir_y*flag, dir_x*flag
    draw(x+dir_x, y+dir_y, array, dir_x, dir_y, flag, turn)
  else
    draw(x+dir_x, y+dir_y, array, dir_x, dir_y, flag, turn)
  end
end

def spiralize(size)
  grid = Array.new(size){ Array.new(size){0}}
  x,y = 0,0
  dir_x, dir_y, flag = 0, 1, -1
  draw(x,y, grid, dir_x, dir_y, flag, 0)
  grid
end

=end
