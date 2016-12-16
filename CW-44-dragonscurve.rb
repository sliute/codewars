def subdragon n
  n == 0 ? result = 'Fa' : result = subdragon(n-1).gsub!(/[ab]/, 'a' => 'aRbFR', 'b' => 'LFaLb')
end

def Dragon n
  n.is_a?(Integer) && n >= 0 ? subdragon(n).delete('ab') : ''
end

=begin



=end
