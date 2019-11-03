class CrossHatchHeuristic
  def initialize(puzzle_cell_intelligence)
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def execute(puzzle, cell)
    find_naked_singles(cell, puzzle)
  end

  private

  def find_naked_singles(cell, puzzle)
    candidates = @puzzle_cell_intelligence.potential_cell_values(puzzle, cell)
    puzzle.set(cell, candidates[0]) if candidates.length == 1
  end
end
