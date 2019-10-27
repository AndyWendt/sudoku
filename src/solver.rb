class Solver
  def initialize(puzzle, puzzle_cell_intelligence)
    @original_puzzle = puzzle.generate
    @puzzle = @original_puzzle
    @puzzle_cell_intelligence = puzzle_cell_intelligence
  end

  def solution
    solved = false
    length = @puzzle.length

    until solved
      for cell in 0..(length-1)
        @puzzle_cell_intelligence.puzzle = @puzzle
        potential_values = @puzzle_cell_intelligence.potential_cell_values(cell)
        if potential_values.length == 1
          @puzzle[cell] = potential_values[0].to_s
        end
      end

      solved = !@puzzle.include?('.')
    end

    @puzzle
  end

  def solvable
    true
  end
end
