require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/*_test.rb"].each {|file| require file }

puts 'begining tests'
c = CaseTest.new
c.test_empty_assert
c.test_empty_invalid_assert
puts 'ending tests'
