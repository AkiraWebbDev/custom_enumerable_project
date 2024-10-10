module Enumerable

  def my_map
    new_arr = []
    for item in self
      new_arr << yield(item)
    end
    new_arr
  end
    
  def my_each_with_index
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end
    
  def my_select
    if block_given?
      new_arr = []
      for item in self
        new_arr << item if yield(item)
      end
      new_arr
    else
      return self
    end
  end

  def my_all?
    self.each do |item|
      return true unless block_given?
      result = yield(item)
      return false unless result
    end
    return true
  end

  def my_any?
    self.each do |item|
      return true if yield(item)
    end
    return false
  end

  def my_none?
    self.each do |item|
      return false if yield(item)
    end
    return true
  end

  def my_count
    count = 0
    if block_given?
      self.each do |item|
        count += 1 if yield(item)
      end
    else
      count = self.length
    end
    return count
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end
