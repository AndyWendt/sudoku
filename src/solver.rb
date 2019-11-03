class Solver
  def initialize(puzzle, heuristics)
    @puzzle = puzzle
    @heuristics = heuristics
  end

  def solution
    until @puzzle.solved
      (0..80).each do |cell|
        next if cell_has_value(@puzzle.get(cell))

        @heuristics.each { |heuristic| heuristic.execute(@puzzle, cell) }
      end
    end

    @puzzle.modified
  end

  private

  def cell_has_value(cell_value)
    !!Integer(cell_value, exception: false)
  end
end
