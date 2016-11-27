def pig_it text
  text_arr = text.split

  text_arr.each { |word| (word.replace(word[1..word.length] + word[0] + 'ay') unless word == '!' || word == '?') }

  text_arr.join(" ")

end

#top solution

def pig_it text
  text.gsub(/(\w)(\w+)*/, '\2\1ay')
end

def pig_it text
  text.split.map{|word| word =~ /\w/ ? "#{word[1..-1]}#{word[0]}ay" : word}.join(" ")
end
