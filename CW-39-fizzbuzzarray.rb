def fizz_buzz_custom(string_1 = 'Fizz', string_2 = 'Buzz', num_1 = 3, num_2 = 5)
  result = (1..100).to_a
  result.each_with_index do |num, index|
    result[index] = string_1 if num % num_1 == 0
    result[index] = string_2 if num % num_2 == 0
    result[index] = string_1 + string_2 if num % num_1 == 0 && num % num_2 == 0
  end
  result
end

=begin

def fizz_buzz_custom(s1 = :Fizz, s2 = :Buzz, n1 = 3, n2 = 5)
  (1..100).to_a.map{|i|
    a = "#{s1 if i % n1 == 0}#{s2 if i % n2 == 0}"
    a.empty? ? i : a
  }
end

=end
