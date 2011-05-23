require "#{File.dirname(__FILE__)}/test/helper.rb"
Dir["#{File.dirname(__FILE__)}/test/**/*_test.rb"].each {|file| require file }

Assertor::Reporter.new.run


