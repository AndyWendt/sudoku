require 'digest'

class Puzzle
  attr_reader :original, :current

  def initialize(puzzle)
    @original = puzzle
    @current = @original
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

  def hash
    Digest::MD5.hexdigest(@current)
  end

  def changed
    true
  end
end
