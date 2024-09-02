def caesar_cipher(message, shift)
  charArray = message.bytes
  charArray = charArray.map do 
    |char| char + shift
  end
  charArray = charArray.map {|char| char.chr}
  cipherMessage = charArray.join
end

puts caesar_cipher('abcde', 1)