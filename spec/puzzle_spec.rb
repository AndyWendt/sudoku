require 'rspec'
require './src/puzzle'

describe Puzzle do
  let(:original_puzzle_string) { '2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3' }
  subject { Puzzle.new(original_puzzle_string) }

  it 'returns the original' do
    expect(subject.original.length).to eq(81)
    expect(subject.original).to eq(original_puzzle_string)
  end

  it 'returns the current puzzle string' do
    expect(subject.current.length).to eq(81)
    expect(subject.current).to eq(original_puzzle_string)
  end
end
