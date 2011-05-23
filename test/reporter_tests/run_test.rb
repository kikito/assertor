require 'helper'
require 'stringio'

module ReporterTests

  class RunTest < Assertor::Case

    def initialize
      @io = StringIO.new
    end
  
    def should_return_000_with_empty_list
      reporter = Assertor::Reporter.new(@io, [])
      reporter.run
      assert_equals(@io.string, "passed: 0   failed: 0   errors: 0\n")
    end

    def should_return_000_with_empty_case
      reporter = Assertor::Reporter.new(@io, [make_named_and_ignored_case(self, :Empty)])
      reporter.run
      assert_equals(@io.string, "passed: 0   failed: 0   errors: 0\n")
    end

    def should_return_100_with_passing_case
      c = make_named_and_ignored_case(self, :Passing)
      c.send :define_method, :test do end
      reporter = Assertor::Reporter.new(@io, [c])
      reporter.run
      assert_equals(@io.string, "passed: 1   failed: 0   errors: 0\n")
    end

    def should_return_010_with_failing_case
      e = Assertor::AssertFailedException.new
      c = make_named_and_ignored_case(self, :Failing)
      c.send :define_method, :test do raise e end
      reporter = Assertor::Reporter.new(@io, [c])
      reporter.run
      expected_string = <<-eos
passed: 0   failed: 1   errors: 0

Failed: #{Failing}.test
   #{e.inspect}
   #{e.backtrace.join("\n   ")}
eos
      assert_equals(@io.string, expected_string)
    end
    
  end

end
