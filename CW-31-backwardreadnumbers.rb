def isprime(n)
  result = true
  for i in 2..Math.sqrt(n)
    result = false if n % i == 0
  end
  result
end

def backwardsPrime(start, stop)
  (start..stop).to_a.select! { |num| isprime(num) && isprime(num.to_s.reverse.to_i) \
  && num.to_s.reverse.to_i != num }
end
