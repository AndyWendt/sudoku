class Helper
  def self.find_next_lowest(value, array)
    upper_index = array.length
    middle_index = upper_index / 2
    lower_index = 0
    found = false
    until found
      middle_value = array[middle_index]
      next_higher_value = array[middle_index + 1]
      next_lower_value = array[middle_index - 1]
      return middle_value if middle_value == value ||
          (upper_index - lower_index) < 1 ||
          (next_higher_value > value && next_lower_value < value && middle_value < value)

      # lower
      if value < middle_value
        upper_index = middle_index - 1
      end

      # higher
      if value > middle_value
        lower_index = middle_index + 1
      end

      length = upper_index - lower_index
      middle_index = (length / 2) + lower_index
    end
  end
end
