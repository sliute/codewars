# Helped a colleague with bugs in their own solution of this kata
# as per the in-line comments below.

require 'time'

def time_out(number)
    hrs = number/3600
    number -= hrs*3600
    min = number/60
    number -= min*60
    sec = number
    number = "#{"%02d" % hrs}|#{"%02d" % min}|#{"%02d" % sec}"
end

def range(array)
    range = (array.last - array[0]).to_i
    range = time_out(range)
end

def median(array)
  x = array.length / 2
  array.sort!
  if array.length % 2 == 1
    median = array[x].to_s
    medianarray = median.split(' ')
    median = medianarray[1].split(':').join('|')
  else
      median = (array[x - 1] + array[x]).to_f / 2
    medianarray = median.to_ssplit(' ')
    median = medianarray[1].split(':').join('|')
  end
    # The initial method did not compute the median correctly.
    # The array must be sorted for the median to be correctly computed.
    # I rewrote it to also work for arrays of even length.
end

def mean(array)
    newarray = []
    array.each do |string|
        split_time = string.split('|').map(&:to_i)
        num = (split_time[0]*3600 + split_time[1] * 60 + split_time[2])
        newarray << num.to_i
    end
    mean = newarray.inject(:+)/newarray.length
    mean = time_out(mean)
end

def stat(strg)
    if strg == ""
        return ""
    else
        splitstring = strg.gsub(/\s/, '').split(',')
        splitstring2 = splitstring
         hrsarray = []

         splitstring.each do |string|
        hrs = Time.strptime(string, "%H|%M|%S")
        hrsarray << hrs
      end
     end
    "Range: " + range(hrsarray) + " Average: " + mean(splitstring) + " Median: " + median(hrsarray)
    # puts always returns nil. And the required order of parameters is R-A-M, not R-M-A.
    # I removed the puts and re-ordered the parameters.
end
