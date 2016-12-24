a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]

def dirReduc(arr)
  n_count = 0
  s_count = 0
  w_count = 0
  e_count = 0

  arr.each do |x|
    case x
      when 'NORTH'
        n_count += 1
      when 'SOUTH'
        s_count += 1
      when 'WEST'
        w_count += 1
      else
        e_count += 1
    end
  end

  ns_bal = n_count - s_count
  ns_bal > 0 ? ns_load = 'NORTH' : ns_load = 'SOUTH'
  we_bal = w_count - e_count
  we_bal > 0 ? we_load = 'WEST' : we_load = 'EAST'

  result = []

  ns_bal.times do
    result << ns_load
  end

  we_bal.times do
    result << we_load
  end

  result

end

p dirReduc(a)


=begin

def dirReduc(arr)
  numval = {
    "NORTH" => 1,
    "SOUTH" => -1,
    "WEST" => 2,
    "EAST" => -2
  }

  for i in 0...arr.length
    if numval[arr[i]] + numval[arr [i+1]] == 0
      arr.delete_at(i)
      arr.delete_at(i+1)
    end
  end

  arr

end

OPPOSITE = {
  "NORTH" => "SOUTH",
  "SOUTH" => "NORTH",
  "EAST"  => "WEST",
  "WEST"  => "EAST"
}

def dirReduc(arr)
  stack = []
  arr.each do |dir|
    OPPOSITE[dir] == stack.last ? stack.pop : stack.push(dir)
  end
  stack
end

=end
