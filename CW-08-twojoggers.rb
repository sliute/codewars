def nbr_of_laps(x, y)
  lcm = x.lcm(y)
  [lcm/x, lcm/y]
end
