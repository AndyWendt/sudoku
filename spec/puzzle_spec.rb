require 'rspec'
require './src/puzzle'

describe Puzzle do
  it 'creates a puzzle' do
    result = Puzzle.new.generate
    # array of arrays
    # array of hashes
    # array of objects that are cells
    # row, column, grid
    expected = [
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
    ]
    expect(result).to eq(expected)
  end
end
