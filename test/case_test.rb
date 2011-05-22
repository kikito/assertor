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

  def test_invalid_assert_with_message
    msg = "Expected message"
    begin
      assert(false, msg)
    rescue Assertor::AssertFailedException => e
      unless e.message == msg
        raise Assertor::AssertFailedException.new("'#{e.message}' should be equal to '#{msg}'")
      end
      return
    end
    raise Assertor::AssertFailedException.new('This test should initially fail')
  end

end
