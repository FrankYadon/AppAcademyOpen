def hipsterfy(word)
  vowels = "aeiou"
  word.split("").to_enum.with_index.reverse_each do |char, i|
    if vowels.include?(char)
      word = word[0...i] + word[i+1..-1]
      break
    end
  end
  word
end

def vowel_counts(string)
  vowels = "aeiou"
  hash = Hash.new(0)
  string.downcase.each_char do |char|
     hash[char] += 1 if vowels.include?(char)
  end
  hash
end

def caesar_cipher(message, n)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  cipher = ""
  message.each_char do |char|
    if alphabet.include?(char)
      i = alphabet.index(char)
      cipher += alphabet[(i + n) % 26]
    else
      cipher += char
    end
  end
  cipher
end
