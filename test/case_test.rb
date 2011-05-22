require 'helper'

class CaseTest < Assertor::Case

  def test_empty_assert
    assert(true)
  end

  def test_empty_invalid_assert
    begin
      assert(false)
    rescue Assertor::AssertFailedException
      return
    end
    throw Assertor::AssertFailedException.new('This test should initially fail')
  end

end
