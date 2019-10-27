class Solver
  def initialize(puzzle, heuristics)
    @puzzle = puzzle
    @heuristics = heuristics
  end

  def solution
    until @puzzle.solved
      (0..80).each do |cell|
        @heuristics.each { |heuristic| heuristic.execute(@puzzle, cell) }
      end
    end

    @puzzle.current
  end
end
