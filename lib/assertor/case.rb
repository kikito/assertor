require 'assertor/assert_failed_exception'

module Assertor

  class Case

    def assert(condition, message)
      raise Assertor::AssertFailedException(message) unless condition
    end

  end

end
