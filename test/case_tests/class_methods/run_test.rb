require 'helper'

module CaseTests

  module ClassMethods

    class RunTest < Assertor::Case

      def should_do_nothing_on_empty_cases
        assert(make_unnamed_case.run == {:passed => [], :failed => [], :errors => [], :exceptions => {}})
      end

      def should_include_passing_tests
        c = make_unnamed_case
        c.send :define_method, :foo do end
        c.send :define_method, :bar do end
        assert_equals(c.run, {:passed => ['bar', 'foo'], :failed => [], :errors => [], :exceptions => {}})
      end

      def should_include_failing_tests
        c = make_unnamed_case
        e = Assertor::AssertFailedException.new('foo')
        c.send :define_method, :foo do raise e end
        c.send :define_method, :bar do raise e end
        assert_equals(c.run, {
          :passed => [],
          :failed => ['bar', 'foo'],
          :errors => [],
          :exceptions => {'foo' => e, 'bar' => e}
        })
      end

      def should_include_erroring_tests
        c = make_unnamed_case
        e = RuntimeError.new('foo')
        c.send :define_method, :foo do raise e end
        c.send :define_method, :bar do raise e end
        assert_equals(c.run, {
          :passed => [],
          :failed => [],
          :errors => ['bar', 'foo'],
          :exceptions => {'foo' => e, 'bar' => e}
        })
      end

    end

  end

end
