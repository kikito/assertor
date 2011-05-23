module Assertor

  class Reporter

    def initialize(io, cases_list)
      @io = io
      @cases_list = cases_list

      @passed, @failed, @errors, @exceptions = [],[],[],{}
    end

    def run
      Assertor::Case.run_all(@cases_list).each do |test_case, results|
        @passed += add_case_name(test_case, results[:passed])
        @failed += add_case_name(test_case, results[:failed])
        results[:exceptions].each do |test, exception|
          @exceptions["#{test_case}.#{test}"] = exception
        end
      end

      @io.puts("passed: #{@passed.size}   failed: #{@failed.size}   errors: #{@errors.size}")

      @failed.each do |t|
        exception = @exceptions[t]
        @io.puts
        @io.puts "Failed: #{t}"
        @io.puts "   #{exception.inspect}"
        @io.print "   "
        @io.puts exception.backtrace.join("\n   ")
      end
        
    end


  private

    def add_case_name(test_case, tests)
      tests.collect{ |test| "#{test_case}.#{test}" }
    end


  end

end
