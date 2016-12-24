=begin
In this kata you will have to calculate fib(n) where:

fib(0) := 0
fib(1) := 1
fin(n + 2) := fib(n + 1) + fib(n)
Write an algorithm that can handle n where 1000000 ≤ n ≤ 1500000.

Your algorithm must output the exact integer answer, to full precision. Also, it must correctly handle negative numbers as input.

HINT I: Can you rearrange the equation fib(n + 2) = fib(n + 1) + fib(n) to find fib(n) if you already know fin(n + 1) and fib(n + 2)? Use this to reason what value fib has to have for negative values.

HINT II: See http://mitpress.mit.edu/sicp/chapter1/node15.html

https://www.codewars.com/kata/53d40c1e2f13e331fc000c26/train/ruby

=end

def iterfib(second_fib_seed, first_fib_seed, r, q, counter)
  if counter == 0
    first_fib_seed
  else
    # algorithm based on Hint II above (Structure and Interpretation of Computer Programs)
    # p' = p**2 + q**2
    # q' = 2pq + q**2
    counter.even? ? iterfib(second_fib_seed, first_fib_seed, r**2 + q**2, 2*r*q + q**2, counter/2) : iterfib(first_fib_seed*q + second_fib_seed*q + second_fib_seed*r, first_fib_seed*r + second_fib_seed*q, r, q, counter-1)
  end
end

def fib(n)
  if n >= 0
    iterfib(1,0,0,1,n)
  else
    n.even? ? -iterfib(1,0,0,1,n.abs) : iterfib(1,0,0,1,n.abs)
  end
end

=begin

require 'matrix'

def fib(n)
  (Matrix[[1,1],[1,0]] ** n)[1,0]
end


def fib(n)
  a,b,p,q = 1,0,0,1
  if n < 0
    (-n+1).even? ? fib(-n) : -fib(-n)
  else
    while n > 0 do
      if n.even?
        p, q, n = p*p + q*q, 2*p*q + q*q, (n / 2).floor
      else
        olda = a
        a, b, n = b*q + a*q + a*p, b*p + a*q, n - 1
      end
    end
    b
  end
end

=end
