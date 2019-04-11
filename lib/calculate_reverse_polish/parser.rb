class Parser
  OPERATIONS = %w(+ - * /)

  def parse(input)
    result = { args: [] }
    input_arr = input.strip.split
    input_arr.each do |item|
      result[:args] << item.to_i if item =~ /[[:digit:]]/
      result[:op] = item if OPERATIONS.include?(item)
    end
    result
  end
end