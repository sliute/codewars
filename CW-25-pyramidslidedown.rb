=begin

Pyramids are amazing! Both in architectural and mathematical sense. If you have a computer, you can mess with pyramids even if you are not in Egypt at the time. For example, let's consider the following problem. Imagine that you have a plane pyramid built of numbers, like this one here:

   /3/
  \7\ 4
 2 \4\ 6
8 5 \9\ 3
Here comes the task...

Let's say that the 'slide down' is a sum of consecutive numbers from the top to the bottom of the pyramid. As you can see, the longest 'slide down' is 3 + 7 + 4 + 9 = 23

Your task is to write a function longestSlideDown (in ruby: longest_slide_down) that takes a pyramid representation as argument and returns its' longest 'slide down'. For example,

longest_slide_down([[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]])
# => 23
By the way...

My tests include some extraordinarily high pyramides so as you can guess, brute-force method is a bad idea unless you have a few centuries to waste. You must come up with something more clever than that.

https://rosettacode.org/wiki/Maximum_triangle_path_sum#Ruby

=end

def longest_slide_down(pyramid)
  pyramid.inject([]){|res,x|
  maxes = [0, *res, 0].each_cons(2).map(&:max)
  x.zip(maxes).map{|a,b| a+b}
  }.max
end

def longest_slide_down(pyramid)
  very_last_row = pyramid.pop
  pyramid.reverse.inject(very_last_row) do |last_row, row|
    best_choices = last_row.each_cons(2).map(&:max)
    row.zip(best_choices).map { |x| x.inject(:+) }
  end[0]
end

def longest_slide_down pyramid
  pyramid.reverse.reduce{|y, x| x.map.with_index{|c, j| c + y.slice(j,2).max }}.max
end
