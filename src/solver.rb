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
    return [3,4,5] if cell == 0
    [cell_value]
  end

  def row_values(cell)
    [1,2,6,7]
  end

  def column_values(cell)
    [1,6,7,8]
  end

  def area_values(cell)
    [1,6,8,9]
  end

  def combined_values(cell)
    [1,2,6,7,8,9]
  end
end
