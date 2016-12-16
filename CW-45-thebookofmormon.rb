def mormons(starting_number, reach, target)
  result = 0
  while target - starting_number > 0
    starting_number *= (1 + reach)
    result += 1
  end
  result
end

=begin

def mormons(starting_number, reach, target)
  return 0 if starting_number >= target
  1 + mormons(starting_number + starting_number * reach, reach, target)
end

=end
