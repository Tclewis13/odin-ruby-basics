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
    elsif char.between?(64,91)
      if char + shift < 91
        char + shift
      else
        remainder = 91 - char - shift
        remainder = remainder.abs
        char = 65 + remainder
      end
    else
      char
    end
  end
  charArray = charArray.map {|char| char.chr}
  cipherMessage = charArray.join
end

def dictionary_count(input_string, dictionary)
  output_hash= Hash.new
  dictionary.each {|word| word.downcase!}
  input_string.downcase!


  input_string = input_string.downcase
  dictionary.each do |word|
    if input_string.scan(word).length > 0
      output_hash[word] = (input_string.scan(word).length)
    end
  end
  return output_hash
end


#dictionary_count test
#dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#puts dictionary_count("Howdy partner, sit down! How's it going?", dictionary)

#caesar_cipher test
#puts caesar_cipher("What a string!", 5)