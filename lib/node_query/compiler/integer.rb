# frozen_string_literal: true

module NodeQuery::Compiler
  # Integer represents a ruby integer value.
  class Integer
    include Comparable

    # Initialize a Integer.
    # @param value [Integer] the integer value
    # @param adapter [NodeQuery::Adapter]
    def initialize(value:, adapter:)
      @value = value
      @adapter = adapter
    end

    # Get valid operators.
    # @return [Array] valid operators
    def valid_operators
      NUMBER_VALID_OPERATORS
    end

    def to_s
      @value.to_s
    end
  end
end
