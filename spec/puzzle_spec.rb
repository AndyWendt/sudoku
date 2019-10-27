require 'rspec'
require './src/puzzle'

describe Puzzle do
  let(:original_puzzle_string) { '1..489..673.....4......1295..712.6..5..7.3..8..6.957..9146......2.....378..512..4' }
  let(:modified_puzzle_string) { '15.489..673.....4......1295..712.6..5..7.3..8..6.957..9146......2.....378..512.64' }
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
    expect(subject.current.length).to eq(81)
    subject.set(1, 5)
    subject.set(79, 6)
    expect(subject.current).to eq(modified_puzzle_string)
  end
end
