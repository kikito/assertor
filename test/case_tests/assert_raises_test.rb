require 'helper'

module CaseTests

  class AssertRaisesTest < Assertor::Case

    def test_assert_raises_with_raising_block
      assert_raises do
        raise 'This test should initially fail'
      end
    end

    def test_works_with_block_raising_correct_message
      assert_raises(ArgumentError, 'foo') do
        raise ArgumentError.new('foo')
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

    def test_raises_error_with_block_raising_a_different_message
      begin
        assert_raises(ArgumentError, 'foo') do
          raise ArgumentError.new('bar')
        end
      rescue Assertor::AssertFailedException => e
        raise "Erroneous message: #{e.message}" unless e.message == "Expected message to be 'foo', got 'bar'"
        return
      end
      raise 'This test should initially fail'
    end

  end

end
