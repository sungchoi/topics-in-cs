require_relative '../lib/solver'

describe TicTacToe::Solver do
  let(:rows)   { [["x", "o", "o"],
                  ["o", "x", "x"],
                  [nil, "x", nil]] }
  let(:solver)   { TicTacToe::Solver.new(rows) }

  it "#next_move" do
    expect(solver.next_move).to eq(8)
  end
end
