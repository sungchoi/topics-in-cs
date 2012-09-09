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
  
  it "returns true for random palindromes" do
    random_palindrome = create_random_palindrome
    gibberish_palindrome.palindrome?.should eq true
  end
  
  private
  def create_random_palindrome
    characters = ("a".."z").to_a + ["'", ",", ".", "?", "+", "-", "=", "|", " /", "<", ">", ":", "\"", "~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", " " ] 
    string_length = rand(1000)
    string = ""
    string_length.times { string += characters[rand(52)]}
    mirror = string.split("").reverse.join("")
    random_palindrome = string + mirror
  end
  
  def create_random_numerical_palindrome
    
  end
  
end