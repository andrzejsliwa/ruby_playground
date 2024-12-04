# frozen_string_literal: true

require_relative "my_rspec/version"

module MyRspec
  class Exception < StandardError; end

  def self.describe(description, &block)
    context = Context.new(description)
    context.instance_eval(&block) if block_given?
    context.run
  end

  class Context
    def initialize(description)
      @description = description
      @tests = []
    end

    def it(description, &block)
      @tests << { description: description, block: block }
    end

    def run = nil

    def let(name, &block)
      raise MyRspec::Exception.new "Name: #{name} is expected to be a symbol!" unless name.is_a?(Symbol)
      raise MyRspec::Exception.new "Missing block in let(#{name.inspect})!" unless block_given?

      @lets ||= {}
      @lets[name] = block

      define_singleton_method(name) do
        @memoized ||= {}
        @memoized[name] ||= instance_eval(&@lets[name])
      end
    end
  end
end
