def palindrome?(str)
  test = ""
  (0...str.length).each { |i| test = str[i] + test}
  test == str
end

def substrings(str)
  subs = []
  (0...str.length).each do |i|
    (1..str.length).each do |j|
      if j > i
        word = str[i...j]
        subs << word
      end
    end
  end
  subs
end

def palindrome_substrings(str)
  substrings(str).select{ |word| palindrome?(word) && word.length > 1 }
end