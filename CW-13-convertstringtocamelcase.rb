str = 'abcdef_ghijkl_mnopqr'

str_arr = str.split('-') if str.include?('-')
str_arr = str.split('_') if str.include?('_')

camel_case = ''
str_arr[0] == str_arr[0].capitalize ? cap = 1 | cap = 0

str_arr.each { |item| camel_case << item}

camel_case.downcase! if cap == 0

puts camel_case


#top solution

def to_camel_case(str)
  str.gsub(/[_-](.)/) {"#{$1.upcase}"}
end

def to_camel_case(str)
  str.gsub('_','-').split('-').each_with_index.map{ |x,i| i == 0 ? x : x.capitalize }.join
end

def to_camel_case(str)
  str.gsub(/([\-_][a-zA-Z])/) do |m|
   m[1].upcase
  end
end
