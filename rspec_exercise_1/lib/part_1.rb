def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr)
  arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sent)
  word_arr = []
  sent.split.each_with_index do |word, i|
    if i.even?
      word_arr << word.upcase
    else
      word_arr << word.downcase
    end
  end
  word_arr.join(" ")
end