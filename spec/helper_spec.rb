require 'rspec'
require './src/helper'

describe Helper do
  let(:values) {[0,3,6,27,30,33,54,57,60]}

  it 'finds the next lowest number in an array' do
    expect(Helper.find_next_lowest(80, values)).to eq(60)
  end
end
