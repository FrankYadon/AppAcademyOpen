def all_words_capitalized?(word_array)
  word_array.all? { |word| word == word.capitalize }
end

def no_valid_url?(url_array)
  url_array.none? { |url| url.end_with?(".com", ".net", ".io", ".org") }
end

def any_passing_students?(student_array)
  student_array.any? do |student|
    student[:grades].sum / student[:grades].length >= 75
  end
end