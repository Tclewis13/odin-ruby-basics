def caesar_cipher(message, shift)
  charArray = message.bytes
  charArray = charArray.map do |char| 
    if char.between?(96,123)
      if char + shift < 123
        char + shift
      else
        remainder = 123 - char - shift
        remainder = remainder.abs
        char = 97 + remainder
      end
    end
  end
  charArray = charArray.map {|char| char.chr}
  cipherMessage = charArray.join
end

puts caesar_cipher('wxyz', 3)