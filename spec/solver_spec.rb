require 'rspec'
require 'ostruct'
require './src/solver'

describe Solver do
  it 'solves a puzzle' do
    puzzle_string = '2.............62....1....7...6..8...3...9...7...6..4...4....8....52.............3'
    puzzle = OpenStruct.new(generate: puzzle_string)
    solution = '284375196739816254651942378476128539312594687598637412143769825965283741827451963'
    result = Solver.new.solve(puzzle)
    expect(result).to eq(solution)
  end
end
