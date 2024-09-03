# frozen_string_literal: true

def caesar_cipher(message, shift)
  charArray = message.bytes
  charArray = charArray.map do |char|
    if char.between?(96, 123)
      if char + shift < 123
        char + shift
      else
        remainder = 123 - char - shift
        remainder = remainder.abs
        97 + remainder
      end
    elsif char.between?(64, 91)
      if char + shift < 91
        char + shift
      else
        remainder = 91 - char - shift
        remainder = remainder.abs
        65 + remainder
      end
    else
      char
    end
  end
  charArray = charArray.map(&:chr)
  charArray.join
end

def dictionary_count(input_string, dictionary)
  output_hash = {}
  down_dictionary = dictionary.each(&:downcase)
  down_string = input_string.downcase

  down_dictionary.each do |word|
    output_hash[word] = down_string.scan(word).length if down_string.scan(word).length.positive?
  end
  output_hash
end

def stock_picker(input_array)
  best_buy = 0
  best_sell = 0
  best_profit = 0
  input_array.each_with_index do |buy_price, buy_index|
    input_array.each_with_index do |sell_price, sell_index|
      next unless sell_price - buy_price > best_profit && buy_index < sell_index

      best_profit = sell_price - buy_price
      best_buy = buy_index
      best_sell = sell_index
    end
  end
  [best_buy, best_sell]
end

def bubble_sort(input_array)
  made_swap = true

  while made_swap == true
    made_swap = false
    input_array.each_with_index do |_number, index|
      if !input_array[index + 1].nil? && input_array[index] > (input_array[index + 1])
        input_array[index], input_array[index + 1] = input_array[index + 1], input_array[index]
        made_swap = true
      end
    end
  end

  input_array
end

# dictionary_count test
dictionary = %w[below down go going horn how howdy it i low own part partner sit]
puts dictionary_count("Howdy partner, sit down! How's it going?", dictionary)

# caesar_cipher test
puts caesar_cipher('What a string!', 5)

# stockpicker test
puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])

# bubble sort test
puts bubble_sort([4, 3, 78, 2, 0, 2])
