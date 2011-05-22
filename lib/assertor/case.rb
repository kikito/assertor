require 'assertor/assert_failed_exception'

module Assertor

  class Case
    def assert(condition, msg='')
      raise Assertor::AssertFailedException.new(msg) unless condition
    end

    def assert_raises(klass = Exception, msg=nil)
      raise Assertor::AssertFailedException.new('Block expected') unless block_given?
      begin
        yield
      rescue Exception => e
        unless e.is_a? klass
          raise Assertor::AssertFailedException.new("Expected #{klass} to be raised, got #{e.class}")
        end
        unless msg.nil? or e.message == msg
          raise Assertor::AssertFailedException.new("Expected message to be '#{msg}', got '#{e.message}'")
        end
        return
      end
      raise Assertor::AssertFailedException.new('Exception expected')
    end

    def self.tests
      instance_methods(false)
    end
  end

end
