require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/*_test.rb"].each {|file| require file }

puts 'begining tests'
c = CaseTest.new
CaseTest.instance_methods(false).each do |method|
  c.send method
end
puts 'ending tests'
