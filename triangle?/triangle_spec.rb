require_relative './triangle.rb'
require 'rspec'

describe '#triangle?' do
  context "given three sides" do
    it "returns true if it is a real triangle" do
      triangle?(3,4,5).should eq true
      triangle?(2,2,3).should eq true
    end
    it "returns false if it cannot be a triangle" do
      triangle?(1,1,1).should eq false
      triangle?(1,1,100).should eq false
    end
  end
end