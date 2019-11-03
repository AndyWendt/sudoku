class CrossHatchHeuristic
  def initialize(puzzle_cell_intelligence)
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def execute(puzzle, cell)
    find_naked_singles(cell, puzzle)
    find_hidden_singles(cell, puzzle)
  end

  private

  def find_naked_singles(cell, puzzle)
    candidates = @puzzle_cell_intelligence.cell_candidates(puzzle, cell)
    puzzle.set(cell, candidates[0]) if candidates.length == 1
    merge_candidates(puzzle.candidates(cell), candidates, puzzle, cell)
  end

  def find_hidden_singles(cell, puzzle)
    candidate_counts2 = Hash[(1..9).to_a.map { |key| [key, []] }]

    candidate_counts = @puzzle_cell_intelligence
      .grid_candidates(puzzle, cell)
      .reduce(candidate_counts2) do |counts, (cell_location, candidates)|
        candidates.each { |candidate_value| counts[candidate_value].push(cell_location) }
        counts
      end

    candidate_counts.each do |candidate, cells|
      next unless cells.length == 1
      puzzle.set(cells[0], candidate)
    end
  end

  def merge_candidates(old, new, puzzle, cell)
    return puzzle.candidates(cell, new) if old.empty?
    (old - new).each { |candidate| old.delete(candidate) }
    puzzle.candidates(cell, old)
  end
end
