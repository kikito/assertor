require 'helper'

module ReporterTests

  class Defaults < Assertor::Case
    def should_use_standard_io_and_all_tests_by_default
      reporter = Assertor::Reporter.new
      assert_equals(reporter.io, $stdout)
      assert_equals(reporter.case_list, Assertor::Case.all)
    end
  end

end
