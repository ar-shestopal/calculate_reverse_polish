require 'calculate_reverse_polish/errors'

module CalculateReversePolish
  class Operation
    def initialize(op: nil, arg1: nil, arg2: nil)
      @arg1 = arg1.to_f
      @arg2 = arg2.to_f
      @op = op
    end

    def perform
      return arg2.to_f.round(1) unless op && arg1
      binding.pry
      result = case op
        when '+'
          arg1 + arg2
        when '-'
          arg1 - arg2
        when '/'
          arg1 / arg2
        when '*'
          arg1 * arg2
        else
          raise FormatError, "ERROR: Operaton `#{op}` is not supported"
        end
      result.round(1)
    end

    private


    attr_reader :arg1, :arg2, :op
  end
end