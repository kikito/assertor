require 'helper'

module CaseTests

  module ClassMethods

    class AllTest < Assertor::Case
      def should_not_include_anonymous_classes
        assert_not Assertor::Case.all.include? make_unnamed_case
      end

      def should_include_classes_with_name
        assert Assertor::Case.all.include? AllTest
      end
    end

  end

end
