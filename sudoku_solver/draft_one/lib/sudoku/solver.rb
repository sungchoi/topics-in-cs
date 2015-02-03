module Sudoku

  class Solver

    def initialize(string)
      @blocks = string.split("")
      format_blocks
    end

    def answer # solve(Puzzle.new(blocks))
      Puzzle.new(@blocks).solve.to_s
    end

    def format_blocks
      @blocks = @blocks.map do |e|
        if e == 0
          %w[1 2 3 4 5 6 7 8 9]
        else
          e
        end
    end

  end

end
