=begin
Write a function named firstNonRepeatingCharacter that takes a string input, and returns the first character that is not repeated anywhere in the string.

For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

If a string contains all repeating characters, it should return the empty string ("").
=end

def  first_non_repeating_letter(s)
  return '' if s == ''
  holder = ''
  for i in 0...s.length
    count = 0
    for j in 0...s.length
      count += 1 if s[i].downcase == s[j].downcase
    end
    if count == 1
      holder << s[i]
      break
    end
  end
  holder
end

def  first_non_repeating_letter(s)
 # Code go here
 stringmodified = s.downcase
 char_non_repeating = stringmodified.split(//).select {|v| stringmodified.count(v) == 1}.first
 char_non_repeating ? s[stringmodified.index(char_non_repeating)] : ""
end
