def arrCheck(value)
  result = true
  for i in 0...value.length
    !value[i].is_a?(Array) ? result = false : next
  end
  result
end

=begin

def arrCheck(value)
  value.all? { |e| e.is_a? Array }
end

=end
