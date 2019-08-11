# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length > 0
      return self.max - self.min
    end
  end

  def average
    if self.length > 0
      return self.sum(0.0) / self.length
    end
  end

  def median
    len = self.length
    sort = self.sort
    if len < 1
      return nil
    elsif len.odd?
      return sort[len/2]
    else
      return (sort[len/2] + sort[(len/2)-1]) / 2.0
    end
  end

  def counts
    counts = Hash.new(0)
    self.each { |ele| counts[ele] += 1 }
    counts
  end

  def my_count(val)
    count = 0
    self.each { |ele| count += 1 if ele == val }
    count
  end

  def my_index(val)
    self.each_with_index { |ele, i| return i if ele == val}
    nil
  end

  def my_uniq
    new_array = []
    self.each do |ele|
      new_array << ele if !new_array.include?(ele)
    end
    new_array
  end

  def my_transpose
    new_array = []
    self.each { |ele| new_array << [] }
    self.each do |sub_array|
      sub_array.each_with_index do |ele, i|
        new_array[i] << ele
      end
    end
    new_array
  end

end
