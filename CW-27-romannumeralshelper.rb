=begin

roman numerals helper

=end

class RomanNumerals

  def self.to_roman(x)

    mcount = x/1000
    dcount = (x - mcount*1000)/500
    ccount = (x - mcount*1000 - dcount*500)/100
    lcount = (x - mcount*1000 - dcount*500 - ccount*100)/50
    xcount = (x - mcount*1000 - dcount*500 - ccount*100 - lcount*50)/10
    vcount = (x - mcount*1000 - dcount*500 - ccount*100 - lcount*50 - xcount*10)/5
    icount = x - mcount*1000 - dcount*500 - ccount*100 - lcount*50 - xcount*10 - vcount*5

    if ccount > 3
      if dcount > 0
        ccount_ns = 'CM'
        dcount = 0
      else
        ccount_ns = 'CD'
      end
    else
      ccount_ns = 'C'*ccount
    end

    if xcount > 3
      if lcount > 0
        xcount_ns = 'XC'
        lcount = 0
      else
        xcount_ns = 'XL'
      end
    else
      xcount_ns = 'X'*xcount
    end

    if icount > 3
      if vcount > 0
        icount_ns = 'IX'
        vcount = 0
      else
        icount_ns = 'IV'
      end
    else
      icount_ns = 'I'*icount
    end

  latin = 'M'*mcount + 'D'*dcount + ccount_ns + 'L'*lcount + xcount_ns + 'V'*vcount + icount_ns

  end

  def self.from_roman(roman_string)

    roman_string.upcase!
    roman_arr = roman_string.split(//).to_a
    arab = 0
    a_val = {'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1,}
    rank = {'M' => 6, 'D' => 5, 'C' => 4, 'L' => 3, 'X' => 2, 'V' => 1, 'I' => 0,}

    for i in 0...(roman_arr.length - 1)
      rank[roman_arr[i]] >= rank[roman_arr[i+1]] ? arab += a_val[roman_arr[i]] : arab -= a_val[roman_arr[i]]
    end

    arab += a_val[roman_arr.last]

  end

end



class RomanNumerals
  FROM_ROMAN = {
    'M'  => 1000,
    'CM' => 900,
    'D'  => 500,
    'C'  => 100,
    'CD' => 400,
    'XC' => 90,
    'L'  => 50,
    'XL' => 40,
    'X'  => 10,
    'IX' => 9,
    'V'  => 5,
    'IV' => 4,
    'I'  => 1
  }

  TO_ROMAN = FROM_ROMAN.invert

  def self.to_roman number
    result = ''
    while number > 0
      mapping = TO_ROMAN.detect { |k,v| k <= number }
      number -= mapping.first
      result += mapping.last
    end

    result
  end

  def self.from_roman string
    result = 0
    while string.length > 0
      mapping = FROM_ROMAN.detect { |k,v| string.gsub! /^#{k}/, '' }
      result += mapping.last
    end

    result
  end
end
