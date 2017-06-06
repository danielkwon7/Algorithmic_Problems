# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil) #equivalent to bubble_sort
  alphabet ||= ("a".."z").to_a
  sorted = false
  characters = str.chars
  until sorted
    sorted = true 
    characters.each_with_index do |char, idx|
      next if idx == characters.length - 1
      if alphabet.index(char) > alphabet.index(characters[idx+1])
        sorted = false
        characters[idx], characters[idx+1] = characters[idx+1], characters[idx]
      end
    end
  end
  characters.join
end
