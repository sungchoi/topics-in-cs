require_relative './fizzbuzz.rb'
require 'rspec'

describe "fizzbuzz" do
  context "given the range (1..15)" do
    it "returns the correct array of numbers and words" do
    fizzbuzz(1..15).should eq [1,2,'fizz',4,'buzz','fizz',7,8,'fizz','buzz',11,'fizz',13,14,'fizzbuzz']
    end
  end
end