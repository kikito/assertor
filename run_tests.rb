require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/*_test.rb"].each {|file| require file }
r = Assertor::Runner.new
puts(r.run.inspect)
