class InconsistencyInsufficiencyHeuristic
  def initialize(puzzle_cell_intelligence)
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def execute(puzzle, cell)
    @puzzle = puzzle
    potential_values = @puzzle_cell_intelligence.potential_cell_values(@puzzle, cell)
    if potential_values.length == 1
      @puzzle.set(cell, potential_values.first.to_s)
    end
  end
end
