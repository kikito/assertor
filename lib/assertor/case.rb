require 'assertor/assert_failed_exception'

module Assertor

  class Case

    @@all = []

    def self.all
      @@all
    end

    def self.inherited(klass)
      @@all << klass if klass.name
    end

    def self.tests
      instance_methods(false)
    end

    def self.run
      passed, failed, errors, exceptions = [], [], [], {}
      tests.each{ |test| run_single_test(test, passed, failed, errors, exceptions) }
      {:passed => passed.sort, :failed => failed.sort, :errors => errors.sort, :exceptions => exceptions}
    end

    def self.run_all(case_list)
      result = {}
      case_list.each do |c|
        raise ArgumentError.new('Unnamed cases are not accepted in run_all') unless c.name
        result[c.name] = c.run
      end
      result
    end

    def self.ignore(aCase)
      @@all.delete aCase
    end

    def assert(condition, msg='')
      raise_failure(msg) unless condition
    end

    def assert_raises(klass = Exception, msg=nil)
      raise_failure('Block expected') unless block_given?
      begin
        yield
      rescue Exception => e
        raise_failure("Expected #{klass} to be raised, got #{e.class}") unless e.is_a? klass
        raise_failure("Expected message to be '#{msg}', got '#{e.message}'") unless msg.nil? or e.message == msg
        return
      end
      raise_failure('Exception expected')
    end

    private

    def self.run_single_test(test, passed, failed, errors, exceptions)
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

    def raise_failure(msg)
      raise Assertor::AssertFailedException.new(msg)
    end

  end

end
