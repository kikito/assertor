require 'helper'
require 'stringio'

module ReporterTests

  class RunTest < Assertor::Case
  
    def test_with_empty_list
      str = StringIO.new
      reporter = Assertor::Reporter.new(str, [])
      reporter.run
      assert(str.string == "passed: 0   failed: 0   errors: 0\n")
    end

  end

end
