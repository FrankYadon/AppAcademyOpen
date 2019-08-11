def partition(array, num)
  result = [[],[]]
  array.map do |ele|
    if ele < num
      result[0] << ele
    else
      result[1] << ele
    end
  end
  result
end

def merge(hash_1, hash_2)
  hash = hash_1.merge(hash_2)
end

def censor(sent, curse_array)
  vowels = "aeiou"
  safe = sent.split.map do |word|
    if curse_array.include?(word.downcase)
      word.each_char.with_index do |char, i|
        if vowels.include?(char.downcase)
          word[i] = "*"
        end
      end
    else
      word
    end
  end
  safe.join(" ")
end

def power_of_two?(num)
  i = 1
  while i <= num
    return true if i == num
    i *= 2
  end
  return false
end