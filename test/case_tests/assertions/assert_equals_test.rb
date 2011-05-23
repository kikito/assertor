require 'helper'

module CaseTests

  module Assertions

    class AssertEqualsTest < Assertor::Case

      def test_with_equal_values
        assert_equals(1,1)
      end

      def test_with_different_values
        assert_raises Assertor::AssertFailedException, "Expected 1 to be equal to 2" do
          assert_equals(1,2)
        end
      end

    end

  end

end
