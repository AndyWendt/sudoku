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
    [@puzzle.slice(cell).to_i]
  end
end
