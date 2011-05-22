require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/*/*_test.rb"].each {|file| require file }

puts 'begining tests'

[AssertTest, AssertRaisesTest, TestsTest].each do |test_case|
  c = test_case.new
  test_case.instance_methods(false).each do |method|
    puts "#{test_case}.#{method}"
    c.send method
  end
end
puts 'ending tests'
