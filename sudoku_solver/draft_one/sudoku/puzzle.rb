module Sudoku

  class Puzzle < Tree::Node

    # @param [Array] blocks size of 81
    def initialize(blocks)
      rows = [[0..8]
              [9..17]
              [18..26]
              [27..35]
              [36..44]
              [45..53]
              [54..62]
              [63..71]
              [72..80]]
      @puzzle = Matrix.new(rows.map { |row| blocks[row] })
      @value = 

      @parent =
      @children = 
      @next = nxt 
      @prev = prev
      @head_child =
      @tail_child =
    end

    def block_index_to_puzzle_index(block_index)
      [(block_index / 9), (block_index % 9)]
    end

    def solved?
      #no empty blocks, i.e. zeros
      #not impossible
    end

    def impossible?
      @blocks.each do |block, index|
        if block.impossible_row? || block.impossible_column? || block.impossible_square?
          return true # return breaks loop
        end
      end
      #iterate through all blocks
      #if any of them violate any of the three rules return true
    end

    def complete?
      #no empty blocks, i.e. zeros
    end

    def impossible_row?
      @puzzle.row()
    end

    def impossible_column?
      1,10,19,28
    end

    def impossible_square?
    end

  end
 
end
