=begin
How can you tell an extrovert from an introvert at NSA? Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it? According to Wikipedia, ROT13 (http://en.wikipedia.org/wiki/ROT13) is frequently used to obfuscate jokes on USENET.
=end

def rot13(message)
  rotateupper = ('A'..'Z').to_a.rotate(13).join
  rotatelower = ('a'..'z').to_a.rotate(13).join
  (message.tr! "A-Z", rotateupper).tr! "a-z", rotatelower
  message
end

puts rot13("Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.")
