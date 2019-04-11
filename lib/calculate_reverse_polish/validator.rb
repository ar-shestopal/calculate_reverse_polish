require 'errors'

module Validator
  ERROR_MESSAGE = 'Wrong format, please use reverse polish notation. Ex: 1; 1 2 +; 3 -;'

  def validate!(parsed_input)
    raise FormatError, ERROR_MESSAGE unless parsed_input[:args]
    raise FormatError, ERROR_MESSAGE if parsed_input[:args].empty?
    raise FormatError, ERROR_MESSAGE if parsed_input[:args].size < 1 && !parsed_input[:op]
  end
end