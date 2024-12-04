# frozen_string_literal: true

require "test_helper"
require "pry"

class TestContext < Minitest::Test
  def setup
    @context = MyRspec::Context.new("example")
  end

  def test_if_let_block_is_mandatory
    name = :example
    error = assert_raises MyRspec::Exception do
      @context.let(name)
    end
    assert_equal "Missing block in let(:#{name})!", error.message
  end

  def test_if_it_is_defined_in_context
    MyRspec.describe "Example" do
      let(:a) { 42 }
      raise unless a == 42
    end
  end

  def test_if_its_working
    MyRspec.describe "Example" do
      let(:a) { 42 }
      it "example it" do
        raise unless a == 42
      end
    end
  end
end
