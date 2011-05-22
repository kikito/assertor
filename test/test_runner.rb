require 'helper'

class TestCase < Assertor::Case

  def test_cases
    r = Assertor::Runner

    c1 = Class.new Assertor::Case
    c2 = Class.new Assertor::Case

    assert(r.cases == [c1, c2])

  end

end
