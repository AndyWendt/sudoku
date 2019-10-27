class Puzzle
  attr_reader :original, :current

  def initialize(puzzle)
    @original = puzzle
    @current = @original
  end
end
