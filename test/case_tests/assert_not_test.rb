require 'helper'

module CaseTests

  class AssertNotTest < Assertor::Case

    def test_empty_assert
      assert_not(false)
    end

    def test_empty_invalid_assert
      assert_raises Assertor::AssertFailedException do
        assert_not(true)
      end
    end

    def test_assert_with_message
      assert_not(false, "assert_not(false)")
    end

    def test_invalid_assert_with_message
      msg = "Expected message"
      assert_raises Assertor::AssertFailedException, msg do
        assert_not(true, msg)
      end
    end

  end

end
