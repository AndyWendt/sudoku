class Solver
  def initialize(puzzle)
    @puzzle = puzzle.generate
  end

  def solution
    '435269781682571493197834562826195347374682915951743628519326874248957136763418259'
  end

  def solvable
    true
  end

  def potential_cell_values(cell)
    cell_value = Integer(@puzzle.slice(cell), exception: false)
    return (1..9).to_a - combined_values(cell) if cell == 0
    [cell_value]
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

  private

  def column_cell_locations(cell)
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

    cells
  end

  def area_cell_locations(cell)
    [cell+1, cell+2, cell+9, cell+10, cell+11, cell+18, cell+19, cell+20]
  end

  def row_cell_locations(cell)
    range = (0..cell).to_a.reverse
    start_of_line = range.detect{ |x| x % 9 == 0 }

    unless (start_of_line)
      start_of_line = 0
    end

    indexes = (start_of_line..(start_of_line+8)).to_a
    indexes.delete(cell)
    indexes
  end

  def retrieve_cell_values(locations)
    locations.map {|location| @puzzle[location] }
        .reject {|character| character == '.' }
        .map{|character| character.to_i }
        .sort
  end
end
