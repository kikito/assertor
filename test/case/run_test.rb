require 'helper'

class RunTest < Assertor::Case
  def should_do_nothing_on_empty_cases
    c = Class.new Assertor::Case
    assert(c.run == {:passed => [], :failed => [], :errors => []})
  end

  def should_include_passing_tests
    c = Class.new Assertor::Case
    c.send :define_method, :foo do end
    c.send :define_method, :bar do end
    assert(c.run == {:passed => ['bar', 'foo'], :failed => [], :errors => []})
  end

  def should_include_failing_tests
    c = Class.new Assertor::Case
    c.send :define_method, :foo do assert(false) end
    c.send :define_method, :bar do assert(false) end
    assert(c.run == {:passed => [], :failed => ['bar', 'foo'], :errors => []})
  end

  def should_include_erroring_tests
    c = Class.new Assertor::Case
    c.send :define_method, :foo do raise 'foo' end
    c.send :define_method, :bar do raise 'bar' end
    assert(c.run == {:passed => [], :failed => [], :errors => ['bar', 'foo']})
  end

end
