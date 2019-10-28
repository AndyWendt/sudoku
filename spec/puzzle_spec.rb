require 'rspec'
require './src/puzzle'

describe Puzzle do
  let(:original_puzzle_string) { '1..489..673.....4......1295..712.6..5..7.3..8..6.957..9146......2.....378..512..4' }
  let(:modified_puzzle_string) { '15.489..673.....4......1295..712.6..5..7.3..8..6.957..9146......2.....378..512.64' }
  let(:solved_puzzle_string) { '152489376739256841468371295387124659591763428246895713914637582625948137873512964' }
  let(:original_puzzle_hash) { 'ac7dd34e3e374f73949b0c74bceb6296' }
  subject { Puzzle.new(original_puzzle_string) }

  it 'returns the original' do
    expect(subject.original.length).to eq(81)
    expect(subject.original).to eq(original_puzzle_string)
  end

  it 'returns the current puzzle string' do
    expect(subject.current.length).to eq(81)
    expect(subject.current).to eq(original_puzzle_string)
  end

  it 'sets values on the current puzzle' do
    subject.set(1, 5)
    subject.set(79, 6)
    expect(subject.current).to eq(modified_puzzle_string)
  end

  it 'determines if it is solved' do
    expect(Puzzle.new(solved_puzzle_string).solved).to eq(true)
  end

  it 'retrieves values from the puzzle' do
    expect(subject.get(0)).to eq(original_puzzle_string[0])
    expect(subject.get(80)).to eq(original_puzzle_string[80])
  end

  it 'returns a unique hash of the puzzle state' do
    expect(subject.hash).to eq(original_puzzle_hash)
  end

  it 'compares a unique hash of the puzzle state with the original' do
    subject.set(1,5)
    expect(subject.changed).to eq(true)
  end
end
