require_relative "../number_of_paths_in_a_2d_array_to"

require "rspec"

describe "number_of_paths_in_a_2d_array_to" do
  it "should return 1 given the coordinates (0, 0)" do
    expect(number_of_paths_in_a_2d_array_to(0,0)).to eq(1)
  end

  it "should return 1 given any coordinates of the form (0, y) or (x, 0)" do
    expect(number_of_paths_in_a_2d_array_to(0, 1)).to eq(1)
    expect(number_of_paths_in_a_2d_array_to(2, 0)).to eq(1)
  end

  it "should return the correct number of paths to coordinates(x, y) from the root (0, 0)" do
    expect(number_of_paths_in_a_2d_array_to(1, 1)).to eq(2)
    expect(number_of_paths_in_a_2d_array_to(2, 2)).to eq(6)
    expect(number_of_paths_in_a_2d_array_to(3, 3)).to eq(20)
    expect(number_of_paths_in_a_2d_array_to(4, 4)).to eq(70)
  end

  it "should return the correct number of paths given a coordinate pair(x,y) where x != y" do
    expect(number_of_paths_in_a_2d_array_to(1,3)).to eq(4)
    expect(number_of_paths_in_a_2d_array_to(1,4)).to eq(5)
  end
end
