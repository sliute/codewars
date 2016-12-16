def line_types lines
  result = []
  lines.each do |item|
    if item.nil?
      result << :unknown
    elsif item.downcase.include?('alpha')
      result << :alpha
    elsif item.downcase.include?('beta')
      result << :beta
    else
      result << :unknown
    end
  end
  result
end

=begin

def line_types lines
  lines.map { |line| line.to_s[/alpha|beta/i].downcase.to_sym rescue :unknown }
end

=end
