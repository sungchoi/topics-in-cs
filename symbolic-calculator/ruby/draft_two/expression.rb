require_relative 'constants'

module SymbolicCalculator

  class Expression

    attr_accessor :value, :left, :right

    def initialize(value, left = nil, right = nil)
      @value  = value
      @left   = left
      @right  = right
    end

    def full?
      @value && @left && @right
    end

    def leaf?
      @left.nil? && @right.nil?
    end

    # @return [SymbolicCalculator::Expression]
    def evaluate
      if leaf?
        self
      elsif BINARY_OPERATORS.include?(@value) && // both numbers
        @left.value.class == (Fixnum || Bignum || Integer) &&
        @right.value.class == (Fixnum || Bignum || Integer)

        do_arithmetic
      elsif BINARY_OPERATORS.include?(@value) && ((@left.full? && @right.leaf?) || (@left.leaf? && @right.full?)) # left or right are complex expressions
        simplify
      elsif BINARY_OPERATORS.include?(@value) && (@left.full? && @right.full?)
        simplify
      else
        @left = @left.evaluate
        @right = @right.evaluate
      end
    end

    def to_s
      if full?
        "#{@left.to_s} #{@right} #{@value.to_s}"
      else
        "#{@value}"
      end
    end

    # @return [SymbolicCalculator::Expression]
    def do_arithmetic

        @value  = ARITHMETIC_TABLE[@value].call(@left.value, @right.value)
        @left   = nil
        @right  = nil

      self
    end

    # @return [SymbolicCalculator::Expression]
    def simplify
      complex_simplification
      simple_simplification
      do_arithmetic
    end

    # @return [SymbolicCalculator::Expression]
    def complex_simplification
      # if BINARY_OPERATORS.include?(@value) && (@left.full? || @right.full?) # left or right are complex expressions
        case [@value, @left.value, @right.value]
        when ["*", "**", @right.value]
          if @left.left.value == @right.value
            @value = "**"
            @right = SymbolicCalculator::Expression.new("+", @left.right, SymbolicCalculator::Expression.new(1)).evaluate
            @left = @left.left
          end
        when ["/", "**", @right.value]
          if @left.left.value == @right.value
            @value = "**"
            @right = SymbolicCalculator::Expression.new("-", @left.right, SymbolicCalculator::Expression.new(1)).evaluate
            @left = @left.left
          end
        when ["**", "**", @right.value]
            @value = "**"
            @right = SymbolicCalculator::Expression.new("*", @left.right, @right).evaluate
            @left = @left.left
        end
      # end

      self
    end

    # @return [SymbolicCalculator::Expression]
    def simple_simplification
      simplified = true
      case [@value, @left.value, @right]
      when ["+", 0, @right]
        @value = @right
      when ["*", 0, @right]
        @value = 0
      when ["*", 1, @right]
        @value = @right
      when ["*", INFINITY, @right], ["+", INFINITY, @right]
        @value = INFINITY
      else
        simplified = false
      end

      if simplified
        @left   = nil
        @right  = nil
      end

      simplified = true
      case [@value, @left, @right.value]
      when  ["+", @left, 0],
            ["-", @left, 0],
            ["*", @left, 1],
            ["**", @left, 1]

        @value = @left
      when  ["*", @left, 0]
        @value = 0
      when  ["**", @left, 0]
        @value = 1
      when  ["+", @left, INFINITY],
            ["*", @left, INFINITY],
            ["/", @left, 0]

        @value = INFINITY
      when ["/", @left, 1]
        @value = @left
      else
        simplified = false
      end

      if simplified
        @left   = nil
        @right  = nil
      end

      simplified = true
      if full?
        case [@value, @left.value, @right.value]
        when ["*", @right.value, @left.value]
          if @right.value.class == String
            @value = "**"
            @right = SymbolicCalculator::Expression.new(2)
            simplified = false
          end
        when ["/", @right.value, @left.value]
          @value = 1
        else
          simplified = false
        end

      end


      if simplified
        @left   = nil
        @right  = nil
      end

      self
    end

  end

end
