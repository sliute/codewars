=begin
I'm sure, you know Google's "Did you mean ...?", when you entered a search term and mistyped a word. In this kata we want to implement something similar.

You'll get an entered term (lowercase string) and an array of known words (also lowercase strings). Your task is to find out, which word from the dictionary is most similar to the entered one. The similarity is described by the minimum number of letters you have to add, remove or replace in order to get from the entered word to one of the dictionary. The lower the number of required changes, the higher the similarity between each two words.

Same words are obviously the most similar ones. A word that needs one letter to be changed is more similar to another word that needs 2 (or more) letters to be changed. E.g. the mistyped term berr is more similar to beer (1 letter to be replaced) than to barrel (3 letters to be changed in total).

Extend the dictionary in a way, that it is able to return you the most similar word from the list of known words.

Code Examples: I know, many of you would disagree that java is more similar to heaven than all the other ones, but in this kata it is ;)

Additional notes: there is always exactly one possible solution

https://www.codewars.com/kata/5259510fc76e59579e0009d4/train/ruby

=end

class Dictionary

  def initialize(words)
    @words=words
  end

  def levenshtein(first, second)
    m, n = first.length, second.length
    return m if n == 0
    return n if m == 0

    d = Array.new(m+1) {Array.new(n+1)}
    0.upto(m) { |i| d[i][0] = i }
    0.upto(n) { |j| d[0][j] = j }

    1.upto(n) do |j|
      1.upto(m) do |i|
        d[i][j] = first[i-1] == second[j-1] ? d[i-1][j-1] : [d[i-1][j]+1,d[i][j-1]+1,d[i-1][j-1]+1,].min
      end
    end
    d[m][n]
  end

  def find_most_similar(term)
    ld_dictionary = Hash.new
    min_ld = 1000
    @words.each {|word| ld_dictionary[word] = levenshtein(term, word)}
    ld_dictionary.each_value {|value| min_ld = value if value < min_ld }
    ld_dictionary.each_key {|key| return key if ld_dictionary[key] == min_ld}
  end

end




class Dictionary
  def initialize(words)
    @words=words
  end
  def find_most_similar(term)
    @words.min_by do |word|
      levenshtein_distance word, term
    end
  end

  private

  def levenshtein_distance(s, t)
    m = s.length
    n = t.length
    return m if n == 0
    return n if m == 0
    d = Array.new(m+1) {Array.new(n+1)}

    (0..m).each {|i| d[i][0] = i}
    (0..n).each {|j| d[0][j] = j}
    (1..n).each do |j|
      (1..m).each do |i|
        d[i][j] = if s[i-1] == t[j-1]  # adjust index into string
                    d[i-1][j-1]       # no operation required
                  else
                    [ d[i-1][j]+1,    # deletion
                      d[i][j-1]+1,    # insertion
                      d[i-1][j-1]+1,  # substitution
                    ].min
                  end
      end
    end
    d[m][n]
  end
end
