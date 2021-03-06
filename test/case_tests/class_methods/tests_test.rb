require 'helper'

module CaseTests

  module ClassMethods

    class TestsTest < Assertor::Case
      def empty_testcase_should_return_no_tests
        assert_equals(make_unnamed_case.tests, [])
      end

      def should_return_public_instance_methods
        c = make_unnamed_case
        c.send :define_method, :foo do end
        c.send :define_method, :bar do end
        c.send :define_method, :baz do end
        c.send :private, :baz
        assert_equals(c.tests.sort, [:bar, :foo])
      end
    end

  end

end
