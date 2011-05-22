require 'assertor/assert_failed_exception'

module Assertor

  class Case
    def assert(condition, msg='')
      raise Assertor::AssertFailedException.new(msg) unless condition
    end

    def assert_raises(klass = Exception)
      raise Assertor::AssertFailedException.new('Block expected') unless block_given?
      begin
        yield
      rescue Exception => e
        unless e.is_a? klass
          raise Assertor::AssertFailedException.new("Expected #{klass} to be raised, got #{e.class}")
        end
        return
      end
      raise Assertor::AssertFailedException.new('Exception expected')
    end
  end

end
