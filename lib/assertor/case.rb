require 'assertor/assert_failed_exception'

module Assertor

  class Case
    def assert(condition)
      raise Assertor::AssertFailedException.new() unless condition
    end
  end

end
