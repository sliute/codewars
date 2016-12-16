def compute
  block_given? ? yield : "Do not compute"
end

p compute 
