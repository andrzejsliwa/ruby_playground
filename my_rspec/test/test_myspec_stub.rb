# frozen_string_literal: true

require "test_helper"
require "pry"

class TestDescribe < Minitest::Test
  def test_myspec_stub_execution
    assert system("bin/myspec")
  end
end
