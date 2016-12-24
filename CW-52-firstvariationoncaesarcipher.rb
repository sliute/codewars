# rot is the standard Caesar cipher with a given shift
def rot(s, shift)
  rotateupper = ('A'..'Z').to_a.rotate(shift).join
  rotatelower = ('a'..'z').to_a.rotate(shift).join
  s.tr! "A-Z", rotateupper
  s.tr! "a-z", rotatelower
  s
end

def movingShift(s, shift)
  shifted_array = []
  # We split the string into an array of individual characters with .chars.
  # With an indexed loop, we apply the standard Caesar cipher for each character.
  # But the shift is not static - it changes with the index of the character
  # in the array, as the kata requires.
  s.chars.each_with_index { |char, index| shifted_array << rot(char, shift + index) }
  # Then we join the array into a shifted string.
  shifted_string = shifted_array.join
  arr = []
  # We calculate the length of the string we want to allocate to each of the first 4 runners.
  length_for_runner = shifted_string.length / 5
  shifted_string.length % 5 == 0 ? remainder = 0 : remainder = 1
  length_for_runner += remainder
  # We slice the corresponding length from the string and shovel it into the
  # resulting array. Each time we do that, the string shrinks. In the end,
  # there's a remainder, a string of 0-4 characters, which we also add to the
  # resulting array, as the kata requires.
  (1..4).each { |i| arr << shifted_string.slice!(0, length_for_runner) }
  arr << shifted_string
end

def demovingShift(arr, shift)
  deshifted_array = []
  # We join the components of the input (an array of strings), then split the
  # total into an array of individual characters. That's arr.join.chars.
  # We run an indexed loop through this last array. For every character,
  # we insert the reversed Caesar cipher with the same rule as in movingShift.
  # only this time we use a negative shift - the Caesar cipher method works
  # with negative ciphers that do the exact opposite of positive ones.
  arr.join.chars.each_with_index { |char, index| deshifted_array << rot(char, -(shift + index)) }
  # We then join the deshifted_array to produce the deshifted string, i.e. the
  # un-ciphered (initial) clear text.
  deshifted_string = deshifted_array.join
end

=begin

class String
  Caesar_lower_case_letters = ('a'..'z').to_a
  Caesar_upper_case_letters = ('A'..'Z').to_a

  def caesar_shift(n)
  letters = [Caesar_lower_case_letters, Caesar_upper_case_letters].find{|t| t.index(self) }
  return self.dup unless letters
  new_index = (letters.index(self) + n) % letters.length
  letters[new_index]
  end

  def caesar_unshift(n)
    caesar_shift(-n)
  end
end


def movingShift(s, shift)
  encoded = s.chars.each_with_index.map{|c,i| c.caesar_shift(shift + i) }
  result = encoded.each_slice((encoded.length / 5.0).ceil).map(&:join)
  result << '' if result.size < 5
  result
end

def demovingShift(arr, shift)
  source = arr.join.chars
  source.each_with_index.map{|c,i| c.caesar_unshift(shift + i)}.join
end

=end
