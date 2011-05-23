require 'helper'

module CaseTests

  class TestsTest < Assertor::Case
    def empty_testcase_should_return_no_tests
      c = Class.new Assertor::Case
      assert(c.tests == [])
    end

    def should_return_public_instance_methods
      c = Class.new Assertor::Case
      c.send :define_method, :foo do end
      c.send :define_method, :bar do end
      c.send :define_method, :baz do end
      c.send :private, :baz
      assert(c.tests.sort == [:bar, :foo])
    end
  end

end
