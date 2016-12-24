=begin
In mathematics, a Diophantine equation is a polynomial equation, usually in two or more unknowns, such that only the integer solutions are sought or studied.

In this kata we want to find all integers x, y (x >= 0, y >= 0) solutions of a diophantine equation of the form

 x ^ 2 - 4 * y ^ 2 = n
where the unknowns are x and y and n is a given positive number. Solutions x, y will be given as an array of arrays (Ruby, Python, Clojure, JS, CS, TS)
=end

def sol_equa(n)
    arr = []
    for x in 1..(n/2 + 1)
      for y in 0..x/2
        if (x - 2*y)*(x + 2*y) == n
        arr << [x, y]
        end
      end
    end
    arr.reverse!
end

=begin

def sol_equa(n)
    result = []
    (1..(n**0.5).floor).each do |i|
      next unless n % i == 0
      if (i**2 + n) % (2*i) == 0 && (i**2 - n) % (4*i) == 0
        x = (i**2 + n) / (2*i)
        y = (n - i**2) / (4*i)
        result << [x, y]
      end
    end
    result
end

=end
