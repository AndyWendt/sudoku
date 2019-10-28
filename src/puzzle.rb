require 'digest'

class Puzzle
  attr_reader :original, :current

  def initialize(puzzle)
    @original = puzzle.clone.freeze
    @current = puzzle.clone
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
    string ||= @current
    Digest::MD5.hexdigest(string)
  end

  def changed
    hash != hash(@original)
  end
end
