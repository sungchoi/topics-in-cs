require 'rspec'
require_relative 'reverse.rb'

describe '#reverse!' do
  it 'takes a string and returns the string in reverse order' do
    a = "this"
    reverse!(a)
    a.should eq "siht"
    b = "hello"
    reverse!(b)
    b.should eq "olleh"
    c = "a"
    reverse!(c)
    c.should eq "a"
  end
end