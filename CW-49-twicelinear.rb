def dbl_linear(n)
    ary = [1]
    ary.each do |item|
      return ary.uniq.sort[n] if ary.length > (n * 9)
      ary.push(2 * item + 1, 3 * item + 1)
    end
    ary[n]
end

=begin

def dbl_linear(n)
    u=[1]
    (0..n*5).each { |i| u << u[i]*2 + 1 << u[i]*3 + 1}
    u.sort.uniq[n]
end

=end
