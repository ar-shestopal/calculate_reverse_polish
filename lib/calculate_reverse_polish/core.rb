require 'parser'
require 'errors'
require 'operation'

class Core
  def initialize(parser: nil)
    @parser = parser || Parser.new
    @error = ''
    @stack = []
  end

  def process(input)
    parsed = parser.parse(input)
    return error unless valid?(parsed)
    operation = extract(parsed)

    operation.perform
  end

  private

  def extract(parsed_args)
    parsed_args = parsed[:args]
    prev_result = stack.unshift

    arg1 = parsed_args[0]
    arg2 = parsed_args[1] || prev_result
    op = parsed[:op]

    Operation.new(arg1: arg1, arg2: arg2, op: op)
  end



  attr_reader :parser, :error, :stack

  def valid?(parsed)
    Validator.validate!(parsed)
  rescue FormatError => err
    @error = "ERROR: #{err}"
    false
  end
end