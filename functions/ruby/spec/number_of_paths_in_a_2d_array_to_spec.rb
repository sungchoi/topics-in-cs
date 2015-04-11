require_relative "../number_of_paths_in_a_2d_array_to"

require "rspec"

describe "number_of_paths_in_a_2d_array_to" do
  it "should return 0 given a 2D array of size 0,0" do
    expect(number_of_paths_in_a_2d_array_to(0,0)).to eq(1)
  end

  it "should return the correct number of paths from the root index(0, 0) of the 2D array to the index(m, n)" do
    expect(number_of_paths_in_a_2d_array_to(1, 1)).to eq(2)
    expect(number_of_paths_in_a_2d_array_to(2, 2)).to eq(6)
    expect(number_of_paths_in_a_2d_array_to(3, 3)).to eq(20)
    expect(number_of_paths_in_a_2d_array_to(4, 4)).to eq(70)
  end
end
