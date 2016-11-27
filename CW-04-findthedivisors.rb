def gap(g, m, n)
  require 'prime'

  for i in m...n-g
    if (i.prime? and (i+g).prime?)
      g_gap_primes = [i, i+g]
      break
    end
  end

  g_gap_primes

end

puts gap(2,100,110)
