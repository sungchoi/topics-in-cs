module TicTacToe
  class Board

    attr_reader :index

    def initialize(values, options = {})
      @rows = values.is_a?(Array) && values.length == 3 ? values : build_rows(values)
      @player = options.fetch(:player, nil)
      @index = options.fetch(:index, nil)
    end

    def build_rows(values)
      values = values.strip.split("") if values.is_a?(String)
      rows = [[],[],[]]
      values.each_with_index do |value, index|
        rows[index / 3][index % 3] = value
      end

      rows
    end

    def children
      return @children if @children
      return @children = [] if won? || lost?
      children = []
      @rows.flatten.each_with_index do |e, index|
        if e == nil
          rows_copy = @rows.flatten
          rows_copy[index] = current_player
          children << TicTacToe::Board.new(rows_copy, {player: @player, index: index})
        end
      end

      children
    end

    def player
      @player ||= current_player
    end

    def current_player
      return @current_player if @current_player
      counts = @rows.flatten.each_with_object({"x" => 0, "o" => 0, nil => 0}) { |e, counts| counts[e] += 1 }
      @current_player = counts["x"] > counts["o"] ? "o" : "x"
    end

    def opponent
      @opponent ||= player == "x" ? "o" : "x"
    end

    def chances(memo = {wins: 0, loses: 0, ties: 0, index: @index})
      # TODO:
      # Dynamic Programming.
      # Cache results to remove redundancy and increase speed.
      if won?
        memo[:wins] += 1
      elsif lost?
        memo[:loses] += 1
      elsif tied?
        memo[:ties] += 1
      else
        children.each do |child|
          child.chances(memo)
        end
      end

      return memo
    end

    def child_chances
      children.map { |child| child.chances }
    end

    def complete?
      #TODO
      @complete ||= !rows.flatten.include?(nil) 
    end

    def won?
      return @won if @won
      (rows + columns.push(diagonal).push(reverse_diagonal)).each do |array|
        return true if @won = array.count(player) == 3
      end
      return @won = false
    end

    def lost?
      return @lost if @lost
      (rows + columns.push(diagonal).push(reverse_diagonal)).each do |array|
        return true if @lost = array.count(opponent) == 3
      end
      return @lost = false
    end

    def tied?
      return @tied if @tied
      @tied = complete? && !won? && !lost?
    end

    def diagonal
      @diagonal ||= [@rows[0][0], @rows[1][1], @rows[2][2]]
    end

    def reverse_diagonal
      @reverse_diagonal ||= [@rows[0][2], @rows[1][1], @rows[2][0]]
    end

    def rows
      @rows
    end

    def columns
      @columns ||= [[@rows[0][0], @rows[1][0], @rows[2][0]],
                    [@rows[0][1], @rows[1][1], @rows[2][1]],
                    [@rows[0][2], @rows[1][2], @rows[2][2]]]
    end

  end
end
