require 'rspec'
require './src/puzzle'

describe Puzzle do
  let(:original_puzzle_string) { '1..489..673.....4......1295..712.6..5..7.3..8..6.957..9146......2.....378..512..4' }
  let(:modified_puzzle_string) { '15.489..673.....4......1295..712.6..5..7.3..8..6.957..9146......2.....378..512.64' }
  let(:solved_puzzle_string) { '152489376739256841468371295387124659591763428246895713914637582625948137873512964' }
  let(:original_puzzle_hash) { 'ac7dd34e3e374f73949b0c74bceb6296' }
  subject { Puzzle.new(original_puzzle_string) }

  it 'returns a blank cell as nil' do
    expect(subject.get(1)).to eq(nil)
  end

  it 'returns the original' do
    expect(subject.original.length).to eq(81)
    expect(subject.original).to eq(original_puzzle_string)
  end

  it 'returns the current puzzle string' do
    expect(subject.modified.length).to eq(81)
    expect(subject.modified).to eq(original_puzzle_string)
  end

  it 'sets values on the current puzzle' do
    subject.set(1, 5)
    subject.set(79, 6)
    expect(subject.modified).to eq(modified_puzzle_string)
  end

  it 'determines if it is solved' do
    expect(Puzzle.new(solved_puzzle_string).solved).to eq(true)
  end

  it 'retrieves values from the puzzle' do
    expect(subject.get(0)).to eq(original_puzzle_string[0].to_i)
    expect(subject.get(80)).to eq(original_puzzle_string[80].to_i)
  end

  it 'returns a unique hash of the puzzle state' do
    expect(subject.hash).to eq(original_puzzle_hash)
  end

  describe 'puzzle changing' do
    let(:changed_hash) { '14734fabe44a11026dcb1cad75f4db25' }
    let(:different_hash) { 'f43216896bdeda42a6accd84a53da4c3' }

    before do
      subject.set(1, 5)
    end

    it 'compares a unique hash of the puzzle state with the original' do
      expect(subject.changed).to eq(true)
    end

    it 'compares a unique hash to a base compare' do
      expect(subject.hash).to eq(changed_hash)
      expect(subject.changed(different_hash)).to eq(true)
    end
  end

  describe "cell state" do
    let(:first_half) { [2,3] }
    let(:second_half) { [3,5,7] }
    let(:candidates) { [2, 3, 5, 7] }
    let(:cell) { 1 }

    it 'adds and retrieves the potential values for a cell' do
      result = subject.candidates(cell, candidates)
      expect(result).to eq(candidates)

      result = subject.candidates(cell)
      expect(result).to eq(candidates)
    end

    it 'unsets possible values when setting a value for a cell' do
      result = subject.candidates(1, candidates)
      expect(result).to eq(candidates)

      subject.set(cell, 2)
      expect(subject.candidates(cell)).to eq([])
    end

    it 'returns an empty array when the cell has not been examined' do
      expect(subject.candidates(cell)).to eq([])
    end

    it 'adds candidates' do
      subject.add_candidates(cell, first_half)
      subject.add_candidates(cell, second_half)
      result = subject.candidates(cell)
      expect(result).to eq(candidates)
    end
  end
end
