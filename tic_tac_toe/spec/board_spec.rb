require_relative '../lib/board'

describe TicTacToe::Board do
  let(:rows)   { [["x", "o", "o"],
                  ["o", "x", "x"],
                  [nil, "x", nil]] }
  let(:rows_b) { [["x", "o", "o"],
                  ["o", "x", "x"],
                  ["o", "x", nil]] }
  let(:rows_c) { [["x", "o", "o"],
                  ["o", "x", "x"],
                  [nil, "x", "o"]] }
  let(:rows_d) { [["x", "o", "o"],
                  ["o", "x", "x"],
                  ["o", "x", "x"]] }
  let(:rows_f) { [["x", "o", "o"],
                  ["o", "x", "x"],
                  ["x", "x", "o"]] }
  let(:board)   { TicTacToe::Board.new(rows) }
  let(:board_b) { TicTacToe::Board.new(rows_b, {player: "o"}) }
  let(:board_c) { TicTacToe::Board.new(rows_c, {player: "o"}) }
  let(:board_d) { TicTacToe::Board.new(rows_d, {player: "o"}) }
  let(:board_e) { TicTacToe::Board.new(rows_d, {player: "x"}) }

  let(:rows_x) { [["x", "x", "o"],
                  [nil, "x", "x"],
                  [nil, "o", "o"]] }
  let(:rows_y) { [["x", "x", "o"],
                  [nil, "x", "x"],
                  ["o", "o", "o"]] }
  let(:board_x) { TicTacToe::Board.new(rows_x, {player: "o"}) }
  let(:board_y) { TicTacToe::Board.new(rows_y, {player: "o"}) }


  it "#current_player should know which player's turn it is" do
    expect(board.current_player).to eq("o")
  end

  it "#player should know which player we are calculating for" do
    expect(board.player).to eq("o")
    expect(board.children.first.player).to eq("o")
    expect(board.children.first.children.first.player).to eq("o")
  end

  it "#current_player" do
    expect(board.current_player).to eq("o")
    expect(board.children.first.current_player).to eq("x")
    expect(board.children.first.children.first.current_player).to eq("o")
  end

  it "#opponent should who the opponent is" do
    expect(board.opponent).to eq("x")
    expect(board.children.first.opponent).to eq("x")
    expect(board_b.opponent).to eq("x")
    expect(board_e.opponent).to eq("o")
  end

  it "#children" do
    children = [board.children[0].rows, board.children[1].rows]
    expect(children.include?(rows_b)).to eq(true)
    expect(children.include?(rows_c)).to eq(true)
    expect(children.include?(rows_d)).to eq(false)
    expect(board_b.children[0].rows).to eq(rows_d)

    # an incomplete board that is won or lost should not have any children
    expect(board_y.children.empty?).to eq(true)
  end

  it "#chances " do
    expect(board.chances).to eq({ wins: 0, loses: 1, ties: 1, index: nil})
    expect(board_b.chances).to eq({wins: 0, loses: 1, ties: 0, index: nil})
    expect(board_c.chances).to eq({wins: 0, loses: 0, ties: 1, index: nil})
    expect(board_d.chances).to eq({wins: 0, loses: 1, ties: 0, index: nil})
    expect(board_e.chances).to eq({wins: 1, loses: 0, ties: 0, index: nil})
  end

  it "#child_chances" do
    expect(board.child_chances.include?({ wins: 0, loses: 1, ties: 0, index: 6})).to eq(true)
    expect(board.child_chances.include?({ wins: 0, loses: 0, ties: 1, index: 8})).to eq(true)
    expect(board_b.child_chances.include?({ wins: 0, loses: 1, ties: 0, index: 8})).to eq(true)
  end

  it "#diagonal" do
    expect(board.diagonal).to eq(["x", "x", nil])
  end

  it "#reverse_diagonal" do
    expect(board.reverse_diagonal).to eq(["o", "x", nil])
  end

  it "#rows" do
    expect(board.rows).to eq([["x", "o", "o"],
                              ["o", "x", "x"],
                              [nil, "x", nil]])
  end

  it "#columns" do
    expect(board.columns).to eq([["x", "o", nil],
                                 ["o", "x", "x"],
                                 ["o", "x", nil]])
  end

  it "#complete?" do
    expect(board.complete?).to eq(false)
    expect(board_d.complete?).to eq(true)
  end

  it "#won?" do
    # expect(board.won?(["o", "o", "o"])).to eq(true)
    # expect(board.won?(["o", "x", "o"])).to eq(false)
    # expect(board.won?(["x", "x", "x"])).to eq(false)
    # expect(board.won?(["x", nil, "x"])).to eq(false)
    expect(board.won?).to eq(false)
    expect(board_b.won?).to eq(false)
    expect(board_c.won?).to eq(false)
    expect(board_d.won?).to eq(false)
    expect(board_e.won?).to eq(true)
  end

  it "#lost?" do
    expect(board.lost?).to eq(false)
    expect(board_d.lost?).to eq(true)
    expect(board_e.lost?).to eq(false)
  end

    it "#tied?" do
    expect(board.tied?).to eq(false)
    expect(board_d.tied?).to eq(false)
  end

end
