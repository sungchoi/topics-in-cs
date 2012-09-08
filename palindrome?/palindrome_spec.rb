require './palindrome.rb'
require 'rspec'

describe '#palindrome?' do
  
  it 'returns true for single word palindromes' do
    "civic".palindrome?.should eq true
    "madam".palindrome?.should eq true
    "mom".palindrome?.should eq true
  end
  
  it "returns true for multiple word palindromes and ignores spaces and punctuation" do
    "A man, a plan, a canal: Panama.".palindrome?.should eq true
    "A new order began, a more Roman age bred Rowena.".palindrome?.should eq true
    "On a clover, if alive, erupts a vast, pure evil; a fire volcano.".palindrome?.should eq true
  end
  
  it 'returns false for non palindromes' do
    "civilian".palindrome?.should eq false
    "Mother dearest.".palindrome?.should eq false
    "Roses are red. Violets are blue.".palindrome?.should eq false
  end
  
end