require 'rspec'
require './src/puzzle'

describe Puzzle do
  it 'creates a puzzle' do
    result = Puzzle.new.generate
    expected = [
        [0,0,7,4,3,5,6,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
    ]

    result.each { |row| expect(row.length).to eq(9) }
    expect(result.length).to eq(9)
  end
end
