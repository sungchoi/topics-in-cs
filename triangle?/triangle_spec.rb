require_relative './triangle.rb'
require 'rspec'
include Triangle

describe '#triangle?' do #NOTE: rewrite these tests to generate random sets of lengths for true and false triangles.
  context "given three side lengths" do
    it "returns true if it is a real triangle" do
      side_a = rand(100)
      side_b = rand(100)
      side_c = rand( ((side_a - side_b).abs + 1 )..(side_a + side_b - 1) )
      triangle?(side_a,side_b,side_c).should eq true
      triangle?(side_a,side_c,side_b).should eq true
      triangle?(side_b,side_a,side_c).should eq true
      triangle?(side_b,side_c,side_a).should eq true
      triangle?(side_c,side_a,side_b).should eq true
      triangle?(side_c,side_b,side_a).should eq true
    end
    it "returns false if it cannot be a triangle" do
      side_a = rand(100)
      side_b = rand(100)
      possible_third_side_lengths = (1..500).to_a - (((side_a - side_b).abs + 1 )..(side_a + side_b - 1)).to_a
      side_c = possible_third_side_lengths[ rand(possible_third_side_lengths.length) ]
      triangle?(side_a,side_b,side_c).should eq false
      triangle?(side_a,side_c,side_b).should eq false
      triangle?(side_b,side_a,side_c).should eq false
      triangle?(side_b,side_c,side_a).should eq false
      triangle?(side_c,side_a,side_a).should eq false
      triangle?(side_c,side_b,side_a).should eq false
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