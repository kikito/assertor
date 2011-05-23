require 'helper'

module CaseTests

  module ClassMethods

    class IgnoreTest < Assertor::Case
      
      def test_with_empty_list_of_cases
        make_named_and_ignored_case(self, :IgnoredCase)
        assert_not(Assertor::Case.all.include?(IgnoredCase))
      end

    end

  end

end
