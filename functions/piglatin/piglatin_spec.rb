require 'rspec'
require_relative 'piglatin.rb'

describe '#piglatin' do
  it 'converts a string into piglatin'
end

describe '#piglatin_word' do
  it 'converts a word into piglatin' do
    piglatin_word("news").should eq "ewsnay"
    piglatin_word("quest").should eq "estquay"
    piglatin_word("essay").should eq "essayay"
  end
end