require 'set'
require_relative "btree"

module SymCalc

  OPERATORS = Set.new(%W[+ - * / **])
  NUMBERS   = Set.new((0..9)) #deal with negative numbers, integers greater than 9, decimals, floats, etc.
  VARIABLES = Set.new(("a".."z")).merge(("A".."Z"))
  OPERANDS  = NUMBERS.merge(VARIABLES)

  class Calculator

    def initialize
    end

    def evaluate(expression)
      btree   = expression.btree
      evaluate_private(btree.root)
    end

    private
    def evaluate_private(node)
      #recurse through the btree
      if node.class == Leaf
        node.value
      elsif node.right.class == Leaf && node.left.class == Leaf
        eval(node.left.value + node.value + node.right.value)
      else
        eval(evaluate_private(node.left) + node.value + evaluate_private(node.right))
      end
    end

  end

  # class Token
  # end

  # class Operator < Token
  # end

end
