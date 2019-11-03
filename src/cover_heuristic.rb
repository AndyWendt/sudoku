class CoverHeuristic
  def initialize(puzzle_cell_intelligence)
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def execute(puzzle, cell)
    @puzzle = puzzle
    hash = ''
    while @puzzle.changed(hash)
      hash = @puzzle.hash
      handle_row_cover_values(cell)
      handle_column_cover_values(cell)
      handle_column_area_values(cell)
      handle_single_cell_candidates(cell)
    end
  end

  private

  def handle_column_cover_values(cell)
    cell_values = @puzzle_cell_intelligence.potential_column_cell_values(@puzzle, cell)
    handle_cell_value_covers(cell_values)
  end

  def handle_column_area_values(cell)
    cell_values = @puzzle_cell_intelligence.potential_area_cell_values(@puzzle, cell)
    handle_cell_value_covers(cell_values)
  end

  def handle_row_cover_values(cell)
    row_cell_values = @puzzle_cell_intelligence.potential_row_cell_values(@puzzle, cell)
    handle_cell_value_covers(row_cell_values)
  end

  def handle_single_cell_candidates(cell)
    @puzzle_cell_intelligence
      .potential_row_cell_values(@puzzle, cell)
      .each_with_index do |(cell, potential_values), _|
        next unless potential_values.length == 1

        @puzzle.set(cell, potential_values.first.to_s)
      end
  end

  def handle_cell_value_covers(cell_values)
    uniques = cell_values.each_with_object({}) do |(index, values), uniques|
      values.each do |value|
        (uniques[value] ||= []) << index
      end
    end

    uniques.each.with_index do |(value, cells), _|
      next unless cells.length == 1

      @puzzle.set(cells.first, value.to_s)
    end
  end
end
