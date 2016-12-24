=begin

Your counterfeit method will be passed a coin object and a block called spend.
Calling spend with coin (spend.(coin) or yield coin) should only work once;
spending it again should raise an error. Can you counterfeit a new coin to spend,
or trick spend into accepting coin more than once?

Your solution is tested by the following code:

coin = Object.new
class << coin
  def to_s
    "Coin1"
  end
end

spent = []
counterfeit(coin) do |suspect_coin|
  raise "Already spent #{suspect_coin}" if spent.include? suspect_coin
  is_coin = begin
    suspect_coin.singleton_class == coin.singleton_class
  rescue TypeError
    false
  end
  raise "Not a coin: #{suspect_coin}" unless is_coin
  spent << suspect_coin
end

Test.expect(spent.size > 1, "Less than two coins spent")

https://www.codewars.com/kata/527c3755bb2890568500000d/train/ruby

=end

def counterfeit(coin, &spend)
  spend.(coin) << coin
end
