def iq_test(numbers)
  #your code here

  number_array = numbers.split.map(&:to_i)
  evenness_array = []

  number_array.each do |n|
    if n % 2 == 0
      evenness_array << 1
    else
      evenness_array << 0
    end
  end

  evens = 0

  evenness_array.each do |n|
    if n == 1
      evens += 1
    end
  end

  if evens > 1
    for i in 0..number_array.length
      if number_array[i] % 2 != 0
        position = i+1
        break
      end
    end
  else
    for i in 0..number_array.length
      if number_array[i] % 2 == 0
        position = i+1
        break
      end
    end
  end

  position

end

puts iq_test("1 2 2")

# top solution

def iq_test(numbers)
  nums = numbers.split.map(&:to_i).map(&:even?)
  nums.count(true) > 1 ? nums.index(false) + 1 : nums.index(true) + 1
end

puts iq_test("1 1 2")
