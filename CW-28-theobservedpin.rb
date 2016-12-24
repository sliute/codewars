=begin

Alright, detective, one of our colleagues successfully observed our target person, Robby the robber. We followed him to a secret warehouse, where we assume to find all the stolen stuff. The door to this warehouse is secured by an electronic combination lock. Unfortunately our spy isn't sure about the PIN he saw, when Robby entered it.

The keypad has the following layout:

┌───┬───┬───┐
│ 1 │ 2 │ 3 │
├───┼───┼───┤
│ 4 │ 5 │ 6 │
├───┼───┼───┤
│ 7 │ 8 │ 9 │
└───┼───┼───┘
    │ 0 │
    └───┘
He noted the PIN 1357, but he also said, it is possible that each of the digits he saw could actually be another adjacent digit (horizontally or vertically, but not diagonally). E.g. instead of the 1 it could also be the 2 or 4. And instead of the 5 it could also be the 2, 4, 6 or 8.

He also mentioned, he knows this kind of locks. You can enter an unlimited amount of wrong PINs, they never finally lock the system or sound the alarm. That's why we can try out all possible (*) variations.

* possible in sense of: the observed PIN itself and all variations considering the adjacent digits

Can you help us to find all those variations? It would be nice to have a function, that returns an array of all variations for an observed PIN with a length of 1 to 8 digits. We could name the function getPINs (get_pins in python). But please note that all PINs, the observed one and also the results, must be strings, because of potentially leading '0's.

https://www.codewars.com/kata/5263c6999e0f40dee200059d/train/ruby

=end

def get_pins(observed)

  digits = observed.split(//).to_a
  digits_arr = []
  var_hash = {
  "0"=> ["0", "8"],
  "1"=> ["1", "2", "4"],
  "2"=> ["1", "2", "3", "5"],
  "3"=> ["2", "3", "6"],
  "4"=> ["1", "4", "5", "7"],
  "5"=> ["2", "4", "5", "6", "8"],
  "6"=> ["3", "5", "6", "9"],
  "7"=> ["4", "7", "8"],
  "8"=> ["0", "5", "7", "8", "9"],
  "9"=> ["6", "8", "9"],
  }

  digits.each { |digit| digits_arr << var_hash[digit] }

  return digits_arr[0] if digits.length == 1

  loader = []

  if digits.length == 2
    for j in 0...digits_arr[0].length
      for k in 0...digits_arr[1].length
        loader << digits_arr[0][j] + digits_arr[1][k]
      end
    end
    return loader
  end

  for i in 0...(digits.length - 1)
      for j in 0...digits_arr[i].length
        for k in 0...digits_arr[i+1].length
          loader << digits_arr[i][j] + digits_arr[i+1][k]
        end
      end
      digits_arr[i+1] = loader
  end

  digits_arr.last.select! {|str| str.length == digits.length}

end

p get_pins("1")

=begin

def get_pins(observed)
  mapping = {
    "1" => %w(1 2 4),
    "2" => %w(1 2 3 5),
    "3" => %w(2 3 6),
    "4" => %w(1 4 5 7),
    "5" => %w(2 4 5 6 8),
    "6" => %w(3 5 6 9),
    "7" => %w(4 7 8),
    "8" => %w(5 7 8 9 0),
    "9" => %w(6 8 9),
    "0" => %w(8 0)
  }
  observed.split(//).map {|key| mapping[key] }.reduce {|m, x| m.product(x).map(&:join) }
end



require 'matrix'

KEYPAD = Matrix[
  ["1", "2", "3"],
  ["4", "5", "6"],
  ["7", "8", "9"],
  [nil, "0", nil]
]

def get_pins(observed)
  combos = observed.chars.map { |char|
    row, col = KEYPAD.index(char)

   [[row, col]]
      .concat([row].product([col - 1, col + 1].reject { |i| i < 0 }))
      .concat([row - 1, row + 1].reject { |i| i < 0 }.product([col]))
      .map { |index| KEYPAD.element(*index) }
      .compact
  }

  combos.shift.product(*combos).map(&:join)
end

=end
