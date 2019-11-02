require 'digest'

class Puzzle
  attr_reader :original, :current

  def initialize(puzzle)
    @original = puzzle.clone.freeze
    @current = puzzle.clone
    @cell_possibilities = {}
  end

  def get(position)
    current[position]
  end

  def set(position, value)
    current[position] = value.to_s
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
    @cell_possibilities[cell]
  end
end
