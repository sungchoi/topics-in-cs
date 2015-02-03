
describe Sudoku::Solver do
  it "solves unsolved sudoku puzzles" do
    puzzle_one = []
    solution_one = []
    solver_one = Sudoku::Solver.new(puzzle_one)
    expect(solver_one.solve).to eq(solution_one)
  end
end
