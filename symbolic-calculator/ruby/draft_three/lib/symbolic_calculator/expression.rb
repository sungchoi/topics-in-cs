require_relative '../b_tree/node'

module SymbolicCalculator

  class Expression < BTree::Node

    def evaluate
      if leaf?
        self
      elsif @value.operator? && @left.leaf? && @right.leaf?
        if @left.number? && @right.number?
          case @value.value
          when "+"
            @left.value + @right.value
          when "-"
            @left.value - @right.value
          when "*"
            @left.value * @right.value
          when "/"
            @left.value / @right.value
          end
        elsif @left.variable? || @right.variable?
          #assume unsimplifiable
          #implement simplification here
          self
        end

      else
        SymbolicCalculator::Expression.new(@value, @left.evaluate, @right.evaluate)
      end

    end

  end

end
