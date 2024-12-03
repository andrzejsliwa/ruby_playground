# frozen_string_literal: true

require_relative "my_rspec/version"

module MyRspec
  class Error < StandardError; end

  def self.describe(description, &block)
    context = Context.new(description)
    context.instance_eval(&block) if block_given?
    context.run
  end

  class Context
    def initialize(description)
      @description = description
    end

    def run = nil
  end
end
