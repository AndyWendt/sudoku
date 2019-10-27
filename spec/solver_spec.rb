require 'rspec'
require 'ostruct'
require './src/solver'
require './src/helper'

describe Solver do
  let(:puzzle) {OpenStruct.new(generate: puzzle_string)}
  let(:puzzle_string) { '...26.7.168..7..9.19...45..82.1...4...46.29...5...3.28..93...74.4..5..367.3.18...' }
  let(:solution) { '435269781682571493197834562826195347374682915951743628519326874248957136763418259' }
  let(:solvable) {true}
  subject { Solver.new(puzzle, Helper.new) }

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

  describe 'possible cell values' do
    let(:cell_three_potential_cell_values) {[2]}
    let(:cell_zero_potential_cell_values) {[3,4,5]}

    it 'returns the cell value if it is numeric' do
      expect(subject.potential_cell_values(3)).to eq(cell_three_potential_cell_values)
    end

    it 'returns the potential cell values' do
      expect(subject.potential_cell_values(0)).to eq(cell_zero_potential_cell_values)
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
