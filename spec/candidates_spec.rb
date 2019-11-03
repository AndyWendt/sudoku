require 'rspec'
require 'ostruct'
require './src/candidates'
require './src/helper'
require './src/puzzle'

describe Candidates do
  let(:puzzle) {OpenStruct.new(generate: puzzle_string)}
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:fake_puzzle) {'foobar'}
  let(:puzzle) { Puzzle.new(puzzle_string) }
  subject { Candidates.new(Helper.new) }

  describe 'cell candidates' do
    let(:cell_three_cell_candidates) {[]}
    let(:cell_zero_cell_candidates) {[3,4,5]}
    let(:cell_forty_cell_candidates) {[8]}
    let(:cell_eighty_cell_candidates) {[2,5,9]}

    it 'returns an empty cell value if it is already set on the puzzle' do
      expect(subject.cell(puzzle, 3)).to eq(cell_three_cell_candidates)
    end

    it 'returns the potential cell values' do
      expect(subject.cell(puzzle, 0)).to eq(cell_zero_cell_candidates)
      expect(subject.cell(puzzle, 40)).to eq(cell_forty_cell_candidates)
      expect(subject.cell(puzzle, 80)).to eq(cell_eighty_cell_candidates)
    end
  end

  describe 'candidates for grid' do
    let(:grid_sixty_cell_candidates) {
      {
        60 => [1, 2, 8],
        61 => [],
        62 => [],
        69 => [1, 2, 8],
        70 => [],
        71 => [],
        78 => [2],
        79 => [5],
        80 => [2, 5, 9],
    } }

    it 'returns the candidate cell values for a grid' do
      expect(subject.grid(puzzle, 80)).to eq(grid_sixty_cell_candidates)
    end
  end
end
