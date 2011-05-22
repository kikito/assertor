require 'helper'

class AssertRaisesTest < Assertor::Case

  def test_assert_raises_with_raising_block
    assert_raises do
      raise 'This test should initially fail'
    end
  end

  def test_raises_error_without_block
    begin
      assert_raises
    rescue Assertor::AssertFailedException
      return
    end
    raise 'This test should initially fail'
  end

  def test_raises_error_with_non_raising_block
    begin
      assert_raises do
      end
    rescue Assertor::AssertFailedException => e
      raise "Erroneous message: #{e.message}" unless e.message == 'Exception expected'
      return
    end
    raise 'This test should initially fail'
  end

  def test_raises_error_with_block_raising_a_different_exception
    begin
      assert_raises(ArgumentError) do
        raise "an unexpected error"
      end
    rescue Assertor::AssertFailedException => e
      raise "Erroneous message: #{e.message}" unless e.message == 'Expected ArgumentError to be raised, got RuntimeError'
      return
    end
    raise 'This test should initially fail'
  end



end
