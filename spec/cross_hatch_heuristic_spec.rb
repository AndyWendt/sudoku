require 'rspec'
require_relative '../src/cross_hatch_heuristic'
require_relative '../src/candidates'
require_relative '../src/puzzle'

describe CrossHatchHeuristic do
  # https://dingo.sbs.arizona.edu/~sandiway/sudoku/examples.html
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:puzzle) { Puzzle.new(puzzle_string) }
  let(:cell) { [4] }
  let(:candidates_helper) { Candidates.instance }

  subject { CrossHatchHeuristic.new(candidates_helper) }

  it 'finds hidden singles' do
    subject.execute(puzzle, 80)
    subject.execute(puzzle, 0)
    subject.execute(puzzle, 54)
    expect(puzzle.get(80)).to eq(9)
    expect(puzzle.get(78)).to eq(2)
    expect(puzzle.get(79)).to eq(5)
    expect(puzzle.get(54)).to eq(5)
    expect(puzzle.get(0)).to eq(4)
  end

  it 'naked singles' do
    subject.execute(puzzle, 1)
    subject.execute(puzzle, 7)
    expect(puzzle.get(1)).to eq(3)
    expect(puzzle.get(7)).to eq(8)
  end

  describe "candidates" do
    let(:cell) { 43 }
    it 'sets candidates for the cell if there is not a single value' do
      subject.execute(puzzle, cell)
      expect(puzzle.get(cell)).to eq(nil)
      expect(puzzle.candidates(cell)).to eq([1,5])
    end

    it 'does not set the candidates if they are already set' do
      puzzle.candidates(cell, [1])
      subject.execute(puzzle, cell)
      expect(puzzle.get(cell)).to eq(nil)
      expect(puzzle.candidates(cell)).to eq([1])
    end

    it 'removes candidates for the cell if they do not exist in the new candidates' do
      puzzle.candidates(cell, [2, 5, 3])
      subject.execute(puzzle, cell)
      expect(puzzle.get(cell)).to eq(nil)
      expect(puzzle.candidates(cell)).to eq([5])
    end
  end
end
