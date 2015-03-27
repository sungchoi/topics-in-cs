module SymbolicCalculator

  class VariableToken < Token

    def initialize(value)
      @value  = value
      @type   = :variable
    end

  end

end
