class Array
  remove_method :sample, :shuffle
end

class Random
  remove_method :rand
end

module Kernel
  remove_method :rand, :srand
end

Random.instance_eval { undef :rand, :srand }
Kernel.instance_eval { undef :rand, :srand }
