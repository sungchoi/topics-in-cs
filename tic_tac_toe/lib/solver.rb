require_relative 'board'

module TicTacToe
  class Solver

    def initialize(rows)
      @board = TicTacToe::Board.new(rows)
    end

    def next_move
      # TODO:
      # Dynamic Programming.
      # Cache results to remove redundancy and increase speed
      # Implement inside of Board#chances for first run.
      # Store results for an empty board into an external file
      # for BigO(1) retrieval to be used inside of Solver.
      memo = { chances: -15000, index: nil }
      @board.child_chances.each do |child_chance|
        puts "child_chance: #{child_chance}"
        chances = child_chance[:chances] = ((2 * child_chance[:wins]) - ( 3 * child_chance[:loses]) + child_chance[:ties])
        puts "chances: #{chances}"

        if chances > memo[:chances]
          memo = child_chance
        end
      end

      memo[:index]
    end

  end
end
