def score( dice )

  result = 0
  dice_count = []
  scores = [
  [1, 1, 100],
  [1, 2, 200],
  [1, 3, 1000],
  [1, 4, 1100],
  [1, 5, 1200],
  [2, 3, 200],
  [2, 4, 200],
  [2, 5, 200],
  [3, 3, 300],
  [3, 4, 300],
  [3, 5, 300],
  [4, 3, 400],
  [4, 4, 400],
  [4, 5, 400],
  [5, 1, 50],
  [5, 2, 100],
  [5, 3, 500],
  [5, 4, 550],
  [5, 5, 600],
  [6, 3, 600],
  [6, 4, 600],
  [6, 5, 600]
  ]

  [*1..6].each { |n| dice_count << [n, dice.count(n)] }
  dice_count = dice_count.select { |n| n[1] != 0}
  dice_count.each { |double| scores.each { |triplet| result += triplet[2] if triplet[0..1] == double } }
  result

end

=begin

def score( dice )
  score = 0
  (1..6).each do |i|
    counter = dice.select { |n| n == i }
    score =+ (i == 1 ? 1000 : i * 100) if counter.size >= 3
    score += (counter.size % 3) * 100 if i == 1
    score += (counter.size % 3) * 50 if i == 5
  end
  score
end

=end
