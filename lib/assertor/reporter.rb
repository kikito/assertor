module Assertor

  class Reporter

    def initialize(stream, cases_list)
      @stream = stream
      @cases_list = cases_list
    end

    def run
      @stream.puts("passed: 0   failed: 0   errors: 0")
    end
  end

end
