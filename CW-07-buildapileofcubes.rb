def find_nb(m)
    sum = 0
    i = 1
    while sum <= m
      sum += i ** 3
      if sum == m
        return i
      else
        i += 1
      end
    end
    return -1
end

puts find_nb(4183059834009)

=begin

def find_nb(m)
  ct = 0
  while m > 0
    ct += 1
    m -= ct**3
  end
  m == 0 ? ct : -1
end

=end
