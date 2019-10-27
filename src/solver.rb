class Solver
  def initialize(puzzle, puzzle_cell_intelligence)
    @puzzle = puzzle
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def solution
    until @puzzle.solved
      (0..80).each do |cell|
        potential_values = @puzzle_cell_intelligence.potential_cell_values(cell)
        if potential_values.length == 1
          @puzzle.set(cell, potential_values.first.to_s)
        end
      end
    end

    @puzzle.current
  end
end
