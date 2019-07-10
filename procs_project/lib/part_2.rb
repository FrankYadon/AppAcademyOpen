def reverser(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
  new_words = []
  str.split.each { |word| new_words << prc.call(word) } 
  new_words.join(" ")
end

def greater_proc_value(num, prc1, prc2)
result1 = prc1.call(num)
result2 = prc2.call(num)
return result1 if result1 > result2
result2
end

def and_selector(array, prc1, prc2)
  new_array = []
  array.each do |ele|
    if prc1.call(ele) == true
      new_array << ele if prc2.call(ele) == true
    end
  end
  new_array
end

def alternating_mapper(array, prc1, prc2)
  new_array = []
  array.each_with_index do |ele, idx|
    if idx.even? == true
      new_array << prc1.call(ele)
    else
      new_array << prc2.call(ele)
    end
  end
  new_array
end
