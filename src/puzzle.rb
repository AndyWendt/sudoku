class Puzzle
  attr_reader :original, :current

  def initialize(puzzle)
    @original = puzzle
    @current = @original
  end

  def set(position, value)
    current[position] = value.to_s
  end

  def solved
    !current.include?('.')
  end
end
