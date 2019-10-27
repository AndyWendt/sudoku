class Helper
  def self.find_next_lowest(value, array)
    length = array.length
    middle_index = length / 2
    found = false
    until found
      middle_value = array[middle_index]
      return middle_value if middle_value == value
    end
  end
end
