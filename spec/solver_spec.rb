require 'rspec'
require 'ostruct'
require 'yaml'
require './src/solver'
require './src/helper'
require './src/puzzle_cell_intelligence'

def run_puzzles(puzzle)
  puzzle_string = puzzle['start']
  solution = puzzle['solution']
  expect(puzzle_string.length).to eq(81)
  expect(solution.length).to eq(81)

  puzzle_string.each_char.with_index do |value, index|
    next if (value.eql?('.'))
    expect(value).to eq(solution[index])
  end

  solver = Solver.new(puzzle_string, PuzzleCellIntelligence.new(Helper.new))
  expect(solver.solution).to eq(solution)
end

describe Solver do
  let(:solvable_puzzles) {YAML.load_file('./spec/fixtures/easy-puzzles.yml')}

  it 'solves a puzzle' do
    solvable_puzzles.each { |puzzle| run_puzzles(puzzle) }
  end
end
