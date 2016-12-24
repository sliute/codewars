def isPP(n)

    for i in 2..9
      if (n ** (1.0/i)) == (n ** (1.0/i)).to_i
        result = [(n ** (1.0/i)).to_i, i]
      end
    end

    result

end

=begin

def isPP(n)
  (2..(n ** 0.5)).each do |m|
    k = (Math.log(n) / Math.log(m)).round
    if m ** k == n then
      return [m, k]
    end
  end
  return nil
end


def isPP(n)
    # your code
    for a in (2..n) do
      for b in (2..n) do
        return [a,b] if (a**b) == n
        break if (a**b)>n
      end
      return nil if (a**2)>n
    end
end

=end
