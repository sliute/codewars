=begin
Write a class that, when given a string, will return an uppercase string with each letter shifted forward in the alphabet by however many spots the cipher was initialized to.

For example:

c = CaesarCipher.new(5); # creates a CipherHelper with a shift of five
c.encode('Codewars') # returns 'HTIJBFWX'
c.decode('BFKKQJX') # returns 'WAFFLES'
If something in the string is not in the alphabet (e.g. punctuation, spaces), simply leave it as is.
=end

class CaesarCipher
  def initialize(shift)
    @rotate = ('A'..'Z').to_a.rotate(shift).join
  end

  def encode(string)
    string.upcase.tr "A-Z", @rotate
  end

  def decode(string)
    string.tr @rotate, "A-Z"
  end
end
