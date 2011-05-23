require 'helper'

module CaseTests

  class AllTest < Assertor::Case
    def should_not_include_anonymous_classes
      c = Class.new Assertor::Case
      assert(!Assertor::Case.all.include?(c))
    end

    def should_include_classes_with_name
      assert(Assertor::Case.all.include? AllTest)
    end
  end

end
