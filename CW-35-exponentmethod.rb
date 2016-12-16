def power(base, exponent)

  if exponent < 0
    nil
  else
    result = 1
    exponent.times { result *= base }
    result
  end

end

=begin

def power(base, exponent)
  exponent.times.inject(1){ |product| product * base } unless exponent < 0
end

=end
