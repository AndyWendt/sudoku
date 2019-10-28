class CoverHeuristic
  def initialize(puzzle_cell_intelligence)
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def execute(puzzle, cell)
    hash = ''
    while puzzle.changed(hash)
      hash = puzzle.hash
      handle_cover_values(puzzle, cell)
      handle_single_potential_cell_values(puzzle, cell)
    end
  end

  private

  def handle_cover_values(puzzle, cell)
    row_cell_values = @puzzle_cell_intelligence.potential_row_cell_values(puzzle, cell)
    uniques = row_cell_values.each_with_object({}) do |(index, values), uniques|
      values.each do |value|
        (uniques[value] ||= []) << index
      end
    end

    uniques.each.with_index do |(value, cells), _|
      next unless cells.length == 1

      puzzle.set(cells.first, value.to_s)
    end
  end

  def handle_single_potential_cell_values(puzzle, cell)
    prcv = @puzzle_cell_intelligence.potential_row_cell_values(puzzle, cell)
    prcv.each_with_index do |(cell, potential_values), _|
          next unless potential_values.length == 1

          puzzle.set(cell, potential_values.first.to_s)
        end
  end
end
