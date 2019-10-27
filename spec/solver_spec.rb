require 'rspec'
require 'ostruct'
require 'yaml'
require './src/solver'
require './src/helper'
require './src/puzzle_cell_intelligence'
require './src/puzzle'

def run_puzzles(puzzle)
  puzzle_string = puzzle['start']
  solution = puzzle['solution']
  expect(puzzle_string.length).to eq(81)
  expect(solution.length).to eq(81)

  puzzle_string.each_char.with_index do |value, index|
    next if (value.eql?('.'))
    expect(value).to eq(solution[index])
  end

  puzzle = Puzzle.new(puzzle_string)
  solver = Solver.new(puzzle, PuzzleCellIntelligence.new(puzzle, Helper.new))
  expect(solver.solution).to eq(solution)
end

describe Solver do
  describe "easy puzzles" do
    let(:solvable_puzzles) {YAML.load_file('./spec/fixtures/easy-puzzles.yml')}

    it 'solves the puzzles' do
      solvable_puzzles.each { |puzzle| run_puzzles(puzzle) }
    end
  end
end
