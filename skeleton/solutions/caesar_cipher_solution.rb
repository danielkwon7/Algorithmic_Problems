def caesar_cipher(str, shift)
  letters = ("a".."z").to_a

  encoded_str = ""
  str.each_char do |char|
    if char == " "
      encoded_str << " "
      next
    end

    old_idx = letters.find_index(char)
    new_idx = (old_idx + shift) % letters.count

    encoded_str << letters[new_idx]
  end

  encoded_str
end

def caesar_cipher(str, shift)
  alphabet = ("a".."z").to_a * 2
  str.chars.map do |x|
    if alphabet.include?(x)
      index = alphabet.index(x)
      alphabet[index + shift]
    else
      x
    end
  end.join
end
