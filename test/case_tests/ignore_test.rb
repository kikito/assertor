require 'helper'

module CaseTests

  class IgnoreTest < Assertor::Case
    
    def test_with_empty_list_of_cases
      self.class.const_set(:IgnoredCase, Class.new(Assertor::Case))
      Assertor::Case.ignore(IgnoredCase)
      assert(!Assertor::Case.all.include?(IgnoredCase))
    end

  end

end
