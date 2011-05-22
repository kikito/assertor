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
    raise Assertor::AssertFailedException.new('This test should initially fail')
  end

  def test_assert_with_message
    assert(true, "assert(true)")
  end

end
