require_relative 'fibonacci.rb'
require 'rspec'

describe Fib do
  
  let(:fib) {Fib.new}
  
  describe "recursive" do
    it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
      fib.recursive(0).should eq 0
      fib.recursive(1).should eq 1
      fib.recursive(2).should eq 1
      fib.recursive(10).should eq 55    
    end
  end

  describe "recursive_with_dp" do
    it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
      fib.recursive_with_dp(0).should eq 0
      fib.recursive_with_dp(1).should eq 1
      fib.recursive_with_dp(2).should eq 1
      fib.recursive_with_dp(10).should eq 55
      fib.recursive_with_dp(256).should be_an(Integer)        
    end
  end

  describe "nonrecursive" do
    it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
      fib.nonrecursive(0).should eq 0
      fib.nonrecursive(1).should eq 1
      fib.nonrecursive(2).should eq 1
      fib.nonrecursive(10).should eq 55 
      fib.nonrecursive(100000).should be_an(Integer)    
    end
  end

  describe "nonrecursive_old" do
    it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
      fib.nonrecursive_old(0).should eq 0
      fib.nonrecursive_old(1).should eq 1
      fib.nonrecursive_old(2).should eq 1
      fib.nonrecursive_old(10).should eq 55    
      fib.nonrecursive(000000).should be_an(Integer)    
    end
  end

end