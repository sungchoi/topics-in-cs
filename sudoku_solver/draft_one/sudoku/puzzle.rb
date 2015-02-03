require 'matrix'

module Sudoku

  class Puzzle
    include NTree
    include DoublyLinkedList

    @@ROWS = [[0..8]
              [9..17]
              [18..26]
              [27..35]
              [36..44]
              [45..53]
              [54..62]
              [63..71]
              [72..80]]

    # @param [Array<Integer>] blocks
    # @param [Puzzle] parent
    # @param [Puzzle] children
    # @param [Puzzle] nxt
    # @param [Puzzle] prev
    # @param [Puzzle] head
    # @param [Puzzle] tail
    def initialize(blocks, parent = nil, children = nil, nxt = nil, prev = nil, head = nil, tail = nil)
      @blocks   = blocks
      @puzzle   = build_puzzle
      @parent   = parent
      @children = children
      @next     = nxt
      @prev     = prev
      @head     = head #head of children
      @tail     = tail #tail of children
    end

    def solve

      #update build_puzzle tool
      if solved?
        return puzzle # or recreate puzzle by going up through all parents to root.
      elsif impossible?
          #parent.next = Puzzle.new(puzzle)
          parent.next.solve
      else
        if head_child #depth first
          head_child = Puzzle.new(puzzle)
          head_child.solve
        else
          nxt = Puzzle.new(puzzle)
          nxt.solve
        end
      end

      first_array_index = puzzle.each_index do |index|
        return index if piece[index].is_a?(Array)
        return nil if index = puzzle.length - 1
      end

      current_puzzle = puzzle.dup
      if first_array_index
        if puzzle[first_array_index].length = 1
          current_puzzle[first_array_index] = puzzle[first_array_index][0]
          puzzle[first_array_index] = puzzle[first_array_index][0]
        else
          current_puzzle[first_array_index] = puzzle[first_array_index].pop
        end
      end

    end

    # @return [Boolean]
    def solved?
      complete? && !impossible?
      #no empty blocks, i.e. zeros
      #not impossible
    end

    # @runtime linear # Is this still linear since we max of n is 57? It's not quite constant.
    # @runtime BigO(n)
    # @runtime Theta(6n1 + n2) # 2n1 + 2n1 + 2n1 + n2 = 54 + 3 = 57
    #   where n1 = elements in a row, column, or minor = 9 
    #   and n2 = number of rows in a minor = 3
    # @return [Boolean]
    def impossible?
      @blocks.each do |block, block_index|
        puzzle_index = block_index_to_puzzle_index(block_index)
        row_index, column_index = puzzle_index
        if  block.impossible_row?(row_index) ||
            block.impossible_column?(column_index) ||
            block.impossible_square?(block_index)

          return true # return breaks loop
        end
      end

      return false
    end

    private
    # @runtime linear
    # @return [Matrix]
    def build_puzzle
      Matrix.rows(@@ROWS.map { |row| @blocks[row] })
    end

    private
    # @param [Integer] block_index
    # @return [Array<Integer, Integer>]
    def block_index_to_puzzle_index(block_index)
      [(block_index / 9), (block_index % 9)]
    end

    private
    # @param [Integer] block_index
    # @return [Matrix]
    def block_index_to_puzzle_minor(block_index)
      # [0,0] to [2,2] [0,3] to [0,6] [0,6] to [2,8]
      # [3,0] to [4,2] [3,3] to [3,6] [3,6] to [3,8]
      # [6,0] to [8,2] [6,3] to [6,6] [6,6] to [8,8]
      puzzle_index = block_index_to_puzzle_index(block_index)
      start_row, start_col = [((puzzle_index[0] / 3) * 3), ((puzzle_index[1] / 3) * 3)]
      @puzzle.minor(start_row, 3, start_col, 3)
    end

    private
    # @runtime linear
    # @runtime BigO(n)
    # @return [Boolean]
    def complete?
      @blocks.each { |e| return false if e.is_a?(Array) }
      return true
      #no empty blocks, i.e. zeros
    end

    private
    # @runtime linear
    # @runtime BigO(n)
    # @runtime Theta(2n) #check this
    # @return [Boolean]
    def impossible_row?(row_index)
      @puzzle.row(row_index)
        .group_by { |e| e}
        .each { |e| return true if e.size > 1 }

      return false
    end

    private
    # @runtime linear
    # @runtime BigO(n)
    # @runtime Theta(2n) #check this
    # @return [Boolean]
    def impossible_column?(column_index)
      @puzzle.column(column_index)
        .group_by { |e| e }
        .each { |e| return true if e.size > 1 }

      return false
    end

    private
    # @runtime linear
    # @runtime BigO(n)
    # @runtime Theta(n1 * 2n2) #check this
    #   where n1 is the number of rows in puzzle minor 
    #   and n2 is size of elements in puzzle minor 
    # @return [Boolean]
    def impossible_square?(block_index)
      block_index_to_puzzle_minor(block_index)
        .to_a
        .flatten
        .group_by { |e| e }
        .each { |e| return true if e.size > 1 }

      return false
    end

  end
 
end
