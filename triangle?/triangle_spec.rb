require_relative './triangle.rb'
require 'rspec'
include Triangle

describe '#triangle?' do #NOTE: rewrite these tests to generate random sets of lengths for true and false triangles.
  context "given three side lengths" do
    it "returns true if it is a real triangle" do
      triangle?(1,2,2).should eq true
      triangle?(3,4,5).should eq true
      triangle?(2,2,3).should eq true
    end
    it "returns false if it cannot be a triangle" do
      triangle?(1,1,2).should eq false
      triangle?(1,1,100).should eq false
    end
  end
end

describe 'Triangle' do
  describe '#type' do
    context 'given three side lengths' do
      it "returns equilateral for a triangle with three equal side lengths"
      it "returns isosceles for a triangle with exactly two sides of equal lengths"
      it "returns scalene for a triangle with sides lengths of three different lengths"
    end
    context 'given three angles' do
      it "returns equilateral for a triangle with three equal angles"
      it "returns isosceles for a triangle with exactly two equal angles"
      it "returns scalene for a triangle with angles of three different lengths"
    end
  end
end