require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/**/*_test.rb"].each {|file| require file }

passed, failed, errors, exceptions = [], [], [], {}

def print_tests(type, tests, exceptions)
  tests.each do |t|
    puts
    puts "#{type}: #{t}"
    puts "   #{exceptions[t].inspect}"
    puts( "   " + exceptions[t].backtrace.join("\n   "))
  end
end

def add_case_name(test_case, tests)
  tests.collect{ |test| "#{test_case}.#{test}" }
end

Assertor::Case.all.each do |test_case|
  results = test_case.run
  passed += add_case_name(test_case, results[:passed])
  failed += add_case_name(test_case, results[:failed])
  errors += add_case_name(test_case, results[:errors])
  results[:exceptions].each do |test, exception|
    exceptions["#{test_case}.#{test}"] = exception
  end
end

puts "passed: #{passed.size}   failed: #{failed.size}   errors: #{errors.size}"

print_tests('Failed', failed, exceptions)
print_tests('Error', errors, exceptions)


