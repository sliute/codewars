def split_hash_by_key(hash, *args)
  result = []

  args.each do |argument|
    carrier_hash = {}
    hash.each_key do |key|
      raise TypeError, "One of the key given as argument is incorrect!" unless argument.class == key.class
      if key != argument
        carrier_hash[key] = hash[key]
        hash.shift
      else
        result << carrier_hash
        break
      end
    end
  end

  result << hash
  result.delete({})
  result

end

=begin

def split_hash_by_key(hash, *args)
  raise Error unless (args - hash.keys).empty?
  hash.slice_before { |k,v| args.include? k }.map { |a| Hash[a] }
end

=end
