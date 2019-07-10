# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  result = str[0]
  prev = {char: str[0], num: 1}
  (1...str.length).each do |i|
    if str[i] == prev[:char]
      prev[:num] += 1
      if prev[:num] > 2
        result = result[0...-2] + prev[:num].to_s + prev[:char]
      else
        result = result[0...-1] + prev[:num].to_s + prev[:char]
      end 
    else
      result += str[i]
      prev[:char], prev[:num] = str[i], 1
    end
  end

  result
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
