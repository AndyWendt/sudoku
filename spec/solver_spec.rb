require 'rspec'
require 'ostruct'
require './src/solver'
require './src/helper'
require './src/puzzle_cell_intelligence'

describe Solver do
  let(:puzzle) {OpenStruct.new(generate: puzzle_string)}
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:solution) { '435269781682571493197834562826195347374682915951743628519326874248957136763418259' }
  let(:solvable) {true}
  subject { Solver.new(puzzle, PuzzleCellIntelligence.new(Helper.new)) }

  before do
    expect(puzzle_string.length).to eq(81)
    expect(solution.length).to eq(81)

    puzzle_string.each_char.with_index do |value, index|
      next if (value.eql?('.'))
      expect(value).to eq(solution[index])
    end
  end

  it 'solves a puzzle' do
    expect(subject.solution).to eq(solution)
  end

  it 'determines if a puzzle is solvable' do
    expect(subject.solvable).to eq(solvable)
  end
end
