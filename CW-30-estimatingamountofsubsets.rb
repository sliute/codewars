def factorial(n)
  if n == 0
    return 1
  else
    return n *= factorial(n-1)
  end
end

def est_subsets(arr)
  n = arr.uniq.length
  sum = 0
  for i in 1..n do
    sum += factorial(n) / ( factorial(i) * factorial(n-i) )
  end
  sum
end

=begin

def est_subsets(arr)
  2**(Set.new(arr).size)-1
end

=end
