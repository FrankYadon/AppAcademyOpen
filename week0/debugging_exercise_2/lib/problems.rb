# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
  divisors(num).each { |div| return div if prime?(div)}
end

def divisors(num)
  divs = []
  i = num
  while i > 0
    divs << i if num % i == 0
    i -= 1
  end
  divs
end

def prime?(num)
  return false if num < 2
  (2...num).each do |div|
    return false if num % div == 0
  end
  true
end

def unique_chars?(str)
  count = Hash.new(0)
  str.each_char { |key| count[key] += 1 }
  count.each_value { |val| return false if val > 1 }
  true
end

def dupe_indices(arr)
  indices = {}
  arr.each_with_index do |ele, i|
    if indices[ele]
      indices[ele] << i 
    else
      indices[ele] = [i]
    end
  end
  dupes = {}
  indices.each { |k, v| dupes[k] = v if v.length > 1}
  dupes
end

def ana_array(arr_1, arr_2)
  hash_1 = Hash.new(0)
  arr_1.each { |key| hash_1[key] += 1 }
  hash_2 = Hash.new(0)
  arr_2.each { |key| hash_2[key] += 1 }
  hash_1 == hash_2
end