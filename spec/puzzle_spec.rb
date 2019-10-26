require 'rspec'
require './src/puzzle'

describe Puzzle do
  it 'creates a puzzle' do
    result = Puzzle.new.generate
    expect(result).to eq('puzzle')
  end
end
