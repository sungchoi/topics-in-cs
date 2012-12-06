require_relative 'fibonacci.rb'
require 'rspec'

describe "fibonacci_recursive" do
  it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
    fibonacci_recursive(0).should eq 0
    fibonacci_recursive(1).should eq 1
    fibonacci_recursive(2).should eq 1
    fibonacci_recursive(10).should eq 55    
  end
end

describe "fibonacci_recursive_with_dp" do
  it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
    fibonacci_recursive_with_dp(0).should eq 0
    fibonacci_recursive_with_dp(1).should eq 1
    fibonacci_recursive_with_dp(2).should eq 1
    fibonacci_recursive_with_dp(10).should eq 55    
  end
end

describe "fibonacci_recursive_with_dp_enhanced" do
  it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
    fibonacci_recursive_with_dp_enhanced(0).should eq 0
    fibonacci_recursive_with_dp_enhanced(1).should eq 1
    fibonacci_recursive_with_dp_enhanced(2).should eq 1
    fibonacci_recursive_with_dp_enhanced(10).should eq 55    
  end
end

describe "fibonacci_nonrecursive" do
  it "returns the correct number from the fibonacci sequence given an index number starting with zero" do
    fibonacci_nonrecursive(0).should eq 0
    fibonacci_nonrecursive(1).should eq 1
    fibonacci_nonrecursive(2).should eq 1
    fibonacci_nonrecursive(10).should eq 55    
  end
end