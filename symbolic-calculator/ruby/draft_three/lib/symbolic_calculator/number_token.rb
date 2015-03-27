module SymbolicCalculator

  class NumberToken < Token

    def initialize(value)
      @value  = value
      @type   = :number
    end

  end

end
