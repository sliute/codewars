def weirdcase(string)
  string_split = string.split.to_a

  string_split.each do |word|
    for i in 0...word.length
      i % 2 == 0 ? word[i] = word[i].upcase : word[i] = word[i].downcase
    end
    word
  end

  new_string = string_split.join(" ")

  new_string
end

puts weirdcase("This is something")



=begin

def weirdcase string
  string.gsub(/(\w{1,2})/) { |s| $1.capitalize }
end

puts weirdcase('Abel cabel si cu BABEL')


def weirdcase(string)
  string.split(' ').map do |word|
    word.split('').each_with_index.map do |char, i|
      i % 2 == 0 ? char.upcase : char.downcase
    end.join('')
  end.join(' ')
end

=end
