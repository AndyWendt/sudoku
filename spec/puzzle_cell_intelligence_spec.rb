require 'rspec'
require './src/puzzle_cell_intelligence'
require 'ostruct'
require './src/helper'

describe PuzzleCellIntelligence do
  let(:puzzle) {OpenStruct.new(generate: puzzle_string)}
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:fake_puzzle) {'foobar'}
  subject do
    pci = PuzzleCellIntelligence.new(Helper.new)
    pci.puzzle = puzzle_string
    pci
  end

  it 'allows you to set the puzzle' do
    subject.puzzle = fake_puzzle
    expect(subject.puzzle).to eq(fake_puzzle)
  end

  describe 'possible cell values' do
    let(:cell_three_potential_cell_values) {[]}
    let(:cell_zero_potential_cell_values) {[3,4,5]}
    let(:cell_forty_potential_cell_values) {[8]}
    let(:cell_eighty_potential_cell_values) {[2,5,9]}

    it 'returns an empty cell value if it is already set on the puzzle' do
      expect(subject.potential_cell_values(3)).to eq(cell_three_potential_cell_values)
    end

    it 'returns the potential cell values' do
      expect(subject.potential_cell_values(0)).to eq(cell_zero_potential_cell_values)
      expect(subject.potential_cell_values(40)).to eq(cell_forty_potential_cell_values)
      expect(subject.potential_cell_values(80)).to eq(cell_eighty_potential_cell_values)
    end
  end

  describe 'cell row values' do
    let(:cell_zero_row_values) {[1,2,6,7]}
    let(:cell_twenty_one_row_values) {[1,4,5,9]}

    it 'returns the values for a row' do
      expect(subject.row_values(0)).to eq(cell_zero_row_values)
      expect(subject.row_values(21)).to eq(cell_twenty_one_row_values)
    end
  end

  describe 'column values' do
    let(:cell_zero_column_values) {[1,6,7,8]}
    let(:cell_thirty_six_column_values) { cell_zero_column_values }

    it 'returns the values for a column' do
      expect(subject.column_values(0)).to eq(cell_zero_column_values)
      expect(subject.column_values(36)).to eq(cell_thirty_six_column_values)
    end
  end

  describe 'area values' do
    let(:cell_zero_area_values) {[1,6,8,9]}
    let(:cell_40_area_values) {[1,2,3,6]}
    let(:cell_eighty_area_values) {[3,4,6,7]}

    it 'returns the values for an area' do
      expect(subject.area_values(0)).to eq(cell_zero_area_values)
      expect(subject.area_values(40)).to eq(cell_40_area_values)
      expect(subject.area_values(80)).to eq(cell_eighty_area_values)
    end
  end

  describe 'combined values' do
    let(:cell_zero_combined_values) {[1,2,6,7,8,9]}
    it 'returns all taken values for a cell' do
      expect(subject.combined_values(0)).to eq(cell_zero_combined_values)
    end
  end
end