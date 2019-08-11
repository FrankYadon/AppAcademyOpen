def select_even_nums(num_array)
  num_array.select(&:even?)
end

def reject_puppies(arr_dog_hash)
  arr_dog_hash.reject { |hash| hash["age"] < 3 }
end

def count_positive_subarrays(array)
  array.count { |arr| arr.sum > 0}
end

def aba_translate(string)
  vowels = "aeiou"
  result = ""
  string.each_char { |c| result += c + "#{ "b" + c if vowels.include?(c) }" }
  result
end

def aba_array(word_array)
  word_array.map { |word| aba_translate(word) }
end