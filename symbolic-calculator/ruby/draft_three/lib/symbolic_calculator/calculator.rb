module SymbolicCalculator

  class Calculator

    def initialize(string)
      @tokens = build_expression_tree_from_string(string)

    end

    private
    def build_expression_tree_from_string(string)
      build_stack(tokenize(string))[0]
    end

    def tokenize(string)
      string.split(" ").map do |word|
        if %w[+ - * /].include(word)
          SymbolicCalculator::OperatorToken.new(word)
        elsif %w[1 2 3 4 5 6 7 8 9]
          SymbolicCalculator::NumberToken.new(word)
        elsif %w[x y z]
          SymbolicCalculator::VariableToken.new(word)
        else
          raise "Invalid word in string"
        end
      end
    end

    def build_stack(tokens)
      stack = []
      tokens.each do |token|
        if token.operator?
          left, right = stack.pop(2)
          stack.push(SymbolicCalculator::Expression.new(token, left, right))
        else
          stack.push(SymbolicCalculator::Expression.new(token))
        end
      end

      return stack
    end
  end

end
