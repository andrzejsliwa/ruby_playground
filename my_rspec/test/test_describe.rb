# frozen_string_literal: true

require "test_helper"

class TestDescribe < Minitest::Test
  def test_if_describe_is_defined
    assert MyRspec.respond_to?(:describe), "MyRspec.describe not defined"
  end
end
