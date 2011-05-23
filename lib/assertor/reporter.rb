module Assertor

  class Reporter

    attr_reader :io, :case_list

    def initialize(io=$stdout, case_list=Assertor::Case.all)
      @io = io
      @case_list = case_list

      @passed, @failed, @errors, @exceptions = [],[],[],{}
    end

    def run
      calculate_results
      print_counters
      print_tests_with_exceptions(@failed, 'Failed')
      print_tests_with_exceptions(@errors, 'Error')
    end


  private
    def calculate_results
      Assertor::Case.run_all(@case_list).each do |test_case, results|
        add_test_results(test_case, results)
      end
    end

    def add_test_results(test_case, results)
      @passed += add_case_name_to_tests(test_case, results[:passed])
      @failed += add_case_name_to_tests(test_case, results[:failed])
      @errors += add_case_name_to_tests(test_case, results[:errors])
      results[:exceptions].each do |test, exception|
        @exceptions["#{test_case}.#{test}"] = exception
      end
    end

    def add_case_name_to_tests(test_case, tests)
      tests.collect{ |test| "#{test_case}.#{test}" }
    end

    def print_counters
      @io.puts("passed: #{@passed.size}   failed: #{@failed.size}   errors: #{@errors.size}")
    end

    def print_tests_with_exceptions(tests, type)
      tests.each do |t|
        exception = @exceptions[t]
        @io.puts
        @io.puts "#{type}: #{t}"
        @io.puts "   #{exception.inspect}"
        @io.print "   "
        @io.puts exception.backtrace.join("\n   ")
      end
    end


  end

end
