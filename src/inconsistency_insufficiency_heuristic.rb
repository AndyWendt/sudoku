class InconsistencyInsufficiencyHeuristic
  def initialize(puzzle_cell_intelligence)
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def execute(puzzle, cell)
    @puzzle = puzzle
    potential_values = @puzzle_cell_intelligence.cell_candidates(@puzzle, cell)
    return nil unless potential_values.length == 1

    @puzzle.set(cell, potential_values.first.to_s)
  end
end
