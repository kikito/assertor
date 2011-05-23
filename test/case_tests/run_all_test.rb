require 'helper'

module CaseTests

  class RunAllTest < Assertor::Case
    
    def test_with_empty_list_of_cases
      assert(Assertor::Case.run_all([]) == {})
    end

    def raises_exception_with_unnamed_cases
      c = Class.new(Assertor::Case)
      assert_raises(ArgumentError) do
        Assertor::Case.run_all([c])
      end
    end

    def test_with_list_of_empty_cases
      self.class.const_set(:Foo, Class.new(Assertor::Case))
      Assertor::Case.ignore Foo
      assert(Assertor::Case.run_all([Foo]) == {Foo.name => Foo.run})
    end

    def test_with_list_of_normal_cases
      e = RuntimeError.new 'some error'
      self.class.const_set(:Bar, Class.new(Assertor::Case))
      Assertor::Case.ignore Bar
      self.class.const_set(:Baz, Class.new(Assertor::Case))
      Assertor::Case.ignore Baz
      Bar.send :define_method, :foo do end
      Baz.send :define_method, :bar do raise e end
      assert(Assertor::Case.run_all([Bar, Baz]) == {Bar.name => Bar.run, Baz.name => Baz.run})
    end

  end

end
