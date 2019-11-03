require_relative 'helper'

class PuzzleCellIntelligence
  def initialize(helper)
    @helper = helper
  end

  def self.instance
    new(Helper.new)
  end

  def cell_candidates(puzzle, cell)
    @puzzle = puzzle
    cell_value = Integer(@puzzle.get(cell), exception: false)
    return [] if cell_value

    (1..9).to_a - combined_values(cell)
  end

  def potential_row_cell_values(puzzle, cell)
    @puzzle = puzzle
    create_cell_candidates(row_cell_locations(cell, false))
  end

  def potential_column_cell_values(puzzle, cell)
    @puzzle = puzzle
    create_cell_candidates(column_cell_locations(cell, false))
  end

  def potential_area_cell_values(puzzle, cell)
    @puzzle = puzzle
    create_cell_candidates(area_cell_locations(cell))
  end

  private

  def create_cell_candidates(cell_locations)
    cell_locations.each_with_object({}) do |row_cell, row_cell_potential_values|
      row_cell_potential_values[row_cell] = (cell_candidates(@puzzle, row_cell))
      row_cell_potential_values
    end
  end

  def row_values(cell)
    retrieve_cell_values(row_cell_locations(cell))
  end

  def column_values(cell)
    retrieve_cell_values(column_cell_locations(cell))
  end

  def area_values(cell)
    retrieve_cell_values(area_cell_locations(cell))
  end

  def combined_values(cell)
    row_values(cell) | column_values(cell) | area_values(cell)
  end

  def column_cell_locations(cell, exclude_cell = true)
    up_cell = cell
    down_cell = cell
    increment = 9
    cells = []

    while (up_cell += increment) <= 80
      cells.push(up_cell)
    end

    while (down_cell -= increment) >= 0
      cells.push(down_cell)
    end

    cells.push(cell) unless exclude_cell
    cells
  end

  def determine_base_cell_for_area(cell)
    base_cells = [0,3,6,27,30,33,54,57,60]
    baseline_cell = @helper.find_home_row_cell(cell)
    @helper.find_next_lowest(baseline_cell, base_cells)
  end

  def area_cell_locations(cell)
    base_cell = determine_base_cell_for_area(cell)
    [
        base_cell,
        base_cell+1,
        base_cell+2,
        base_cell+9,
        base_cell+10,
        base_cell+11,
        base_cell+18,
        base_cell+19,
        base_cell+20,
    ]
  end

  def row_cell_locations(cell, exclude_cell = true)
    range = (0..cell).to_a.reverse
    start_of_line = range.detect{ |x| x % 9 == 0 }
    start_of_line = 0 unless start_of_line

    indexes = (start_of_line..(start_of_line+8)).to_a
    indexes.delete(cell) if exclude_cell
    indexes
  end

  def retrieve_cell_values(locations)
    locations.map {|location| @puzzle.get(location) }
             .reject {|character| character == '.' }
             .map{|character| character.to_i }
             .sort
  end
end
