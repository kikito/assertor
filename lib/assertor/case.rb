require 'assertor/assert_failed_exception'

module Assertor

  class Case
    def assert(condition, msg='')
      raise Assertor::AssertFailedException.new(msg) unless condition
    end
  end

end
