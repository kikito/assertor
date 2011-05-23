require 'helper'

module CaseTests

  module ClassMethods

    class RunAllTest < Assertor::Case
      
      def test_with_empty_list_of_cases
        assert(Assertor::Case.run_all([]) == {})
      end

      def raises_exception_with_unnamed_cases
        assert_raises(ArgumentError) do
          Assertor::Case.run_all([make_unnamed_case])
        end
      end

      def test_with_list_of_empty_cases
        make_named_and_ignored_case(self, :Foo)
        assert_equals(Assertor::Case.run_all([Foo]), {Foo.name => Foo.run})
      end

      def test_with_list_of_normal_cases
        e = RuntimeError.new 'some error'
        make_named_and_ignored_case(self, :Bar)
        make_named_and_ignored_case(self, :Baz)
        Bar.send :define_method, :foo do end
        Baz.send :define_method, :bar do raise e end
        assert_equals(Assertor::Case.run_all([Bar, Baz]), {Bar.name => Bar.run, Baz.name => Baz.run})
      end

    end

  end

end
