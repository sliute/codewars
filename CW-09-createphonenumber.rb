def createPhoneNumber(numbers)
  numbers_string = numbers.join
  phone_number = '(' + numbers_string[0..2] + ') ' + numbers_string[3..5] + '-' + numbers_string[6..9]
  phone_number
end

=begin

def createPhoneNumber(array)
  '(%d%d%d) %d%d%d-%d%d%d%d' % array
end

=end
