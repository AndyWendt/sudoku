require 'rspec'
require './src/puzzle'

describe Puzzle do
  it 'creates a puzzle' do
    result = Puzzle.new.generate
    expected = "2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3"
    expect(result.length).to eq(81)
    expect(result).to eq(expected)
  end
end
