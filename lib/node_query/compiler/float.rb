# frozen_string_literal: true

module NodeQuery::Compiler
  # Float represents a ruby float value.
  class Float
    include Comparable

    # Initialize a Float.
    # @param value [Float] the float value
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
