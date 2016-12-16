def stat(strg)

    return '' if strg.empty?
    seconds_array = []
    strg.split(", ").each do |i|
      n = i.split("|")
      seconds_array << n[0].to_i*3600 + n[1].to_i*60 + n[2].to_i
    end
    len = seconds_array.length
    seconds_array.sort!

    range = Time.at(seconds_array.max - seconds_array.min).utc.strftime("%H|%M|%S")
    average = Time.at(seconds_array.inject(:+) / len).utc.strftime("%H|%M|%S")
    if seconds_array.length % 2 == 1
      median = Time.at(seconds_array[len/2]).utc.strftime("%H|%M|%S")
    else
      median = Time.at((seconds_array[len/2 - 1] + seconds_array[len/2]).to_f / 2).utc.strftime("%H|%M|%S")
    end

    "Range: #{range} Average: #{average} Median: #{median}"

end
