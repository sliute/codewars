def last_digit(n1, n2)

  digits = [[0], [1], [2, 4, 8, 6], [3, 9, 7, 1], [4, 6], [5], [6], [7, 9, 3, 1], [8, 4, 2, 6], [9, 1]]
  return 0 if n1 == 0
  return 1 if n2 == 0
  last_line = digits[n1 % 10]
  last_dig = last_line[(n2 - 1) % last_line.length]

end
