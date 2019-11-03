require 'digest'

class Puzzle
  attr_reader :original, :current

  def initialize(puzzle)
    @original = puzzle.clone.freeze
    @current = puzzle.clone
    @cell_possibilities = {}
  end

  def get(cell)
    value = convert_to_int(current[cell])
    return nil unless value

    value
  end

  def set(cell, value)
    current[cell] = value.to_s
    possibilities(cell, [])
  end

  def solved
    !current.include?('.')
  end

  def hash(string = nil)
    string ||= current
    Digest::MD5.hexdigest(string)
  end

  def changed(compare_hash = nil)
    compare_hash ||= hash(original)
    hash != compare_hash
  end

  def possibilities(cell, possibilities = nil)
    @cell_possibilities[cell] = possibilities if possibilities
    @cell_possibilities[cell] || []
  end

  def add_possibilities(cell, possibilities_to_add)
    combined = possibilities(cell) + possibilities_to_add
    possibilities(cell, combined.uniq)
  end

  private

  def convert_to_int(value)
    Integer(value, exception: false)
  end
end
