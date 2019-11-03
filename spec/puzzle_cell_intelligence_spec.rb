require 'rspec'
require 'ostruct'
require './src/puzzle_cell_intelligence'
require './src/helper'
require './src/puzzle'

describe PuzzleCellIntelligence do
  let(:puzzle) {OpenStruct.new(generate: puzzle_string)}
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:fake_puzzle) {'foobar'}
  let(:puzzle) { Puzzle.new(puzzle_string) }
  subject { PuzzleCellIntelligence.new(Helper.new) }

  describe 'possible cell values' do
    let(:cell_three_cell_candidates) {[]}
    let(:cell_zero_cell_candidates) {[3,4,5]}
    let(:cell_forty_cell_candidates) {[8]}
    let(:cell_eighty_cell_candidates) {[2,5,9]}

    it 'returns an empty cell value if it is already set on the puzzle' do
      expect(subject.cell_candidates(puzzle, 3)).to eq(cell_three_cell_candidates)
    end

    it 'returns the potential cell values' do
      expect(subject.cell_candidates(puzzle, 0)).to eq(cell_zero_cell_candidates)
      expect(subject.cell_candidates(puzzle, 40)).to eq(cell_forty_cell_candidates)
      expect(subject.cell_candidates(puzzle, 80)).to eq(cell_eighty_cell_candidates)
    end
  end

  describe 'potential row cell values' do
    let(:cell_forty_potential_row_cell_values) {
      {
        36 => [3],
        37 => [1, 3, 7],
        38 => [],
        39 => [],
        40 => [8],
        41 => [],
        42 => [],
        43 => [1, 5],
        44 => [3, 5, 7],
      }
    }

    it 'returns the potential cell values' do
      expect(subject.potential_row_cell_values(puzzle, 40)).to eq(cell_forty_potential_row_cell_values)
    end
  end

  describe 'potential column cell values' do
    let(:cell_forty_potential_column_cell_values) {
      {49=>[4, 9], 58=>[2], 67=>[], 76=>[], 40=>[8], 31=>[9], 22=>[3, 8], 13=>[], 4=>[]}
    }

    it 'returns the potential cell values' do
      expect(subject.potential_column_cell_values(puzzle, 40)).to eq(cell_forty_potential_column_cell_values)
    end
  end

  describe 'potential area cell values' do
    let(:cell_forty_potential_area_cell_values) {
      {30=>[], 31=>[9], 32=>[5, 7, 9], 39=>[], 40=>[8], 41=>[], 48=>[4, 7, 9], 49=>[4, 9], 50=>[]}
    }

    it 'returns the potential cell values' do
      expect(subject.potential_area_cell_values(puzzle, 40)).to eq(cell_forty_potential_area_cell_values)
    end
  end
end
