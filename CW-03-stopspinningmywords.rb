def spinWords(string)
  string_split = string.split.to_a
  string_split.each do |word|
    unless word.length < 5
      word.reverse!
    end
  end
  new_string = string_split.join(" ")
end

puts spinWords("This is something")


# top solutions

def spinWords(string)
  string.gsub(/\w{5,}/, &:reverse)
end


def spinWords(string)
  string.split.map { |s| s.length >= 5 ? s.reverse : s }.join ' '
end
