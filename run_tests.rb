require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/*/*_test.rb"].each {|file| require file }

puts 'begining tests'

[AssertTest, AssertRaisesTest, TestsTest, RunTest].each do |test_case|
  c = test_case.new
  test_case.tests.each do |test|
    puts "#{test_case}.#{test}"
    c.send test
  end
end

puts 'ending tests'
