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
