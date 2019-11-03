require 'rspec'
require 'ostruct'
require './src/inconsistency_insufficiency_heuristic'
require './src/puzzle'
require './src/puzzle_cell_intelligence'

describe InconsistencyInsufficiencyHeuristic do
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:puzzle) { Puzzle.new(puzzle_string) }
  let(:cell) { 0 }
  let(:cell_candidates) { [4] }
  let(:puzzle_cell_intelligence) do
    pci = double("PuzzleCellIntelligence")
    allow(pci).to receive(:cell_candidates).and_return(cell_candidates)
    pci
  end

  subject { InconsistencyInsufficiencyHeuristic.new(puzzle_cell_intelligence) }

  it 'executes' do
    subject.execute(puzzle, cell)
    expect(puzzle.get(0).to_i).to eq(4)
  end
end
