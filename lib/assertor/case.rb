require 'assertor/assert_failed_exception'

module Assertor

  class Case

    @@all = []

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

    def self.run
      passed, failed, errors, exceptions = [], [], [], {}
      tests.each do |test|
        begin
          new.send test
          passed << test.to_s
        rescue Assertor::AssertFailedException => e
          failed << test.to_s
          exceptions[test.to_s] = e
        rescue Exception => e
          errors << test.to_s
          exceptions[test.to_s] = e
        end
      end
      {:passed => passed.sort, :failed => failed.sort, :errors => errors.sort, :exceptions => exceptions}
    end

    def self.all
      @@all
    end

    def self.inherited(klass)
      @@all << klass if klass.name
    end

  end

end
