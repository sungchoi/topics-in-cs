require_relative '../../lib/symbolic_calculator/calculator'

describe SymbolicCalculator::Calculator do

  it "adds integers" do
    expect(SymbolicCalculator::Calculator.new("3 4 +").to_s).to eq("7")
  end

end
