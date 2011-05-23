require 'helper'

module CaseTests

  class AssertTest < Assertor::Case

    def test_empty_assert
      assert(true)
    end

    def test_empty_invalid_assert
      assert_raises Assertor::AssertFailedException do
        assert(false)
      end
    end

    def test_assert_with_message
      assert(true, "assert(true)")
    end

    def test_invalid_assert_with_message
      msg = "Expected message"
      assert_raises Assertor::AssertFailedException, msg do
        assert(false, msg)
      end
    end

end

end
