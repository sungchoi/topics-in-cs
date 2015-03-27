module SymbolicCalculator

  class Token

    attr_reader :value

    def initialize(value)
      @value  = value
      @type   = :base
    end

    def base?
      @type == :base
    end

    def operator?
      @type == :operator
    end

    def variable?
      @type == :variable
    end

    def number?
      @type == :number
    end

  end

end
