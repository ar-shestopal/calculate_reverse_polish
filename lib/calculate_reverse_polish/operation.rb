class Operation
  def initialize(op: nil, arg1: nil, arg2: nil)
    @arg1 = arg1.to_f
    @arg2 = arg2.to_f
    @op = op
  end

  def perform
    return arg1.to_f.round(1) unless op.present? && arg2.present?
    result = case op
    when '+'
      arg1 + arg2
    when '-'
      arg1 + arg2
    when '/'
      arg1 / arg2
    when '*'
      arg1 * arg2
    end
    result.round(1)
  end

  private


  attr_reader :arg1, :arg2, :op
end