require 'rspec'
require_relative '../src/cross_hatch_heuristic'
require_relative '../src/puzzle_cell_intelligence'
require_relative '../src/puzzle'

describe CrossHatchHeuristic do
  # https://dingo.sbs.arizona.edu/~sandiway/sudoku/examples.html
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:puzzle) { Puzzle.new(puzzle_string) }
  let(:potential_cell_values) { [4] }
  let(:puzzle_cell_intelligence) { PuzzleCellIntelligence.instance }

  subject { CrossHatchHeuristic.new(puzzle_cell_intelligence) }

  it 'finds hidden singles' do
    skip
    subject.execute(puzzle, 80)
    subject.execute(puzzle, 0)
    expect(puzzle.get(80)).to eq(9)
    expect(puzzle.get(0)).to eq(4)
  end

  it 'naked singles' do
    subject.execute(puzzle, 1)
    subject.execute(puzzle, 7)
    expect(puzzle.get(1)).to eq(3)
    expect(puzzle.get(7)).to eq(8)
  end

  describe "candidates" do
    it 'sets candidates for the cell if there is not a single value' do
      subject.execute(puzzle, 54)
      expect(puzzle.get(54)).to eq(nil)
      expect(puzzle.candidates(54)).to eq([2,5])
    end

    it 'does not set the candidates if they are already set' do
      puzzle.candidates(54, [2])
      subject.execute(puzzle, 54)
      expect(puzzle.get(54)).to eq(nil)
      expect(puzzle.candidates(54)).to eq([2])
    end
  end
end
