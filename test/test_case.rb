require 'helper'

class TestCase < Assertor::Case

  def test_run
    c = Class.new Assertor::Case
    c = Run
  end


  def test_assert_without_message
    assert(true)
  end



end
