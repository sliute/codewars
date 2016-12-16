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
    median = array[x].to_s
    medianarray = median.split(' ')
    median = medianarray[1].split(':').join('|')
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
    puts "Range: " + range(hrsarray) + " Median: " + median(hrsarray) + " Average: " + mean(splitstring)
end
strg = "01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17"

print stat(strg)
