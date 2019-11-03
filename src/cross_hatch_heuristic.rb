class CrossHatchHeuristic
  def initialize(puzzle_cell_intelligence)
    @candidates = puzzle_cell_intelligence
  end

  def execute(puzzle, cell)
    find_naked_singles(cell, puzzle)
    find_hidden_singles(cell, puzzle)
  end

  private

  def find_naked_singles(cell, puzzle)
    candidates = @candidates.cell(puzzle, cell)
    puzzle.set(cell, candidates[0]) if candidates.length == 1
    merge_candidates(candidates, puzzle, cell)
  end

  def find_hidden_singles(cell, puzzle)
    candidate_counts = Hash[(1..9).to_a.map { |key| [key, []] }]

    candidate_counts = @candidates
      .grid(puzzle, cell)
      .reduce(candidate_counts) do |counts, (location, candidates)|
        puzzle.set(location, candidates[0]) if candidates.length == 1
        candidates.each { |value| counts[value].push(location) } if candidates.length > 1
        counts
      end

    candidate_counts.each do |candidate, cells|
      next unless cells.length == 1
      puzzle.set(cells[0], candidate)
    end

    @candidates
      .grid(puzzle, cell)
      .each do |location, candidates|
        merge_candidates(candidates, puzzle, location)
      end
  end

  def merge_candidates(new, puzzle, cell)
    old = puzzle.candidates(cell)
    return puzzle.candidates(cell, new) if old.empty?
    (old - new).each { |candidate| old.delete(candidate) }
    puzzle.candidates(cell, old)
  end
end
