require 'rspec'
require_relative 'inject_and_map.rb'

describe '#new_inject' do
end

describe '#new_map' do
  it 'provides the functionality of the built in map method' do
    [0,1,2,3,4].new_map{|x| x + 1 }.should eq [1,2,3,4,5]
  end
end

describe '#new_collect' do
end