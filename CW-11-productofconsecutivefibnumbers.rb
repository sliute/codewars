def productFib(prod)
    ff = 0
    fibarr = [0, 1]

    while ff <= prod
      ff = fibarr[-2] * fibarr[-1]
      return result = [fibarr[-2], fibarr[-1], true] if ff == prod
      fibarr << (fibarr[-2] + fibarr[-1])
    end

    return result = [fibarr[-2], fibarr[-1], false]

end

puts productFib(4895)


#top solution

def productFib(prod)
  a, b = [0, 1]
  while prod > a * b
    a, b = [b, a + b]
  end
  [a, b, prod == a * b]
end

puts productFib(4895)
