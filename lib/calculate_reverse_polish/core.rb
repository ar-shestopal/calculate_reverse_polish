require 'calculate_reverse_polish/parser'
require 'calculate_reverse_polish/errors'
require 'calculate_reverse_polish/operation'
require 'pry'

module CalculateReversePolish
  class Core
    attr_accessor :error, :stack

    def initialize(parser: nil)
      @parser = parser || Parser.new
      @stack = []
    end

    def process(input)
      parsed_input = parser.parse(input)

      return error unless valid?(parsed_input)
      operation = extract(parsed_input)

      perform_operation(operation)
    rescue CalculateReversePolish::FormatError => err
      err
    end

    private

    attr_reader :parser

    def extract(parsed_input)
      parsed_args = parsed_input[:args]

      op = parsed_input[:op]
      while parsed_args.any?
        stack.push(parsed_args.shift)
      end

      arg2 = stack.pop
      arg1 = stack.pop

      Operation.new(arg1: arg1, arg2: arg2, op: op)
    end

    def perform_operation(operation)
      result = operation.perform
      stack.push(result)
      binding.pry
      result
    end

    def valid?(parsed)
      Validator.validate!(parsed)
      true
    rescue CalculateReversePolish::FormatError => err
      @error = "ERROR: #{err}"
      false
    end
  end
end