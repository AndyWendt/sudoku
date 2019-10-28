require 'rspec'
require 'ostruct'
require './src/cover_heuristic'
require './src/puzzle'
require './src/puzzle_cell_intelligence'
require './src/helper'

describe CoverHeuristic do
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:puzzle) { Puzzle.new(puzzle_string) }
  let(:puzzle_cell_intelligence) { PuzzleCellIntelligence.new(Helper.new) }
  let(:cell) { 58 }


  subject { CoverHeuristic.new(puzzle_cell_intelligence) }

  it 'executes' do
    subject.execute(puzzle, cell)
    expect(puzzle.get(54).to_i).to eq(5)
    expect(puzzle.get(55).to_i).to eq(1)
    expect(puzzle.get(58).to_i).to eq(2)
    expect(puzzle.get(59).to_i).to eq(6)
    expect(puzzle.get(60).to_i).to eq(8)
  end
end
