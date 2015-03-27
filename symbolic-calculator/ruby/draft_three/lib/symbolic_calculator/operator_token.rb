module SymbolicCalculator

  class OperatorToken < Token

    def initialize(value)
      @value  = value
      @type   = :operator
    end

  end

end
