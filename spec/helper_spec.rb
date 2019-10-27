require 'rspec'
require './src/helper'

describe Helper do
  let(:values) {[0,3,6,27,30,33,54,57,60]}
  subject { Helper.new }

  it 'finds the next lowest number in an array when they are in the array' do
    expect(subject.find_next_lowest(0, values)).to eq(0)
    expect(subject.find_next_lowest(3, values)).to eq(3)
    expect(subject.find_next_lowest(6, values)).to eq(6)
    expect(subject.find_next_lowest(27, values)).to eq(27)
    expect(subject.find_next_lowest(30, values)).to eq(30)
    expect(subject.find_next_lowest(54, values)).to eq(54)
    expect(subject.find_next_lowest(57, values)).to eq(57)
    expect(subject.find_next_lowest(60, values)).to eq(60)
  end

  it 'find values in the range but between those already present' do
    expect(subject.find_next_lowest(1, values)).to eq(0)
    expect(subject.find_next_lowest(7, values)).to eq(6)
    expect(subject.find_next_lowest(58, values)).to eq(57)
    expect(subject.find_next_lowest(56, values)).to eq(54)
    expect(subject.find_next_lowest(62, values)).to eq(60)
    expect(subject.find_next_lowest(79, values)).to eq(60)
  end
end