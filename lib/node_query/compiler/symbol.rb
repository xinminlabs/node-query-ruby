# frozen_string_literal: true

module NodeQuery::Compiler
  # Symbol represents a ruby symbol value.
  class Symbol
    include Comparable

    # Initliaze a Symobol.
    # @param value [Symbol] the symbol value
    # @param adapter [NodeQuery::Adapter]
    def initialize(value:, adapter:)
      @value = value
      @adapter = adapter
    end

    # Get valid operators.
    # @return [Array] valid operators
    def valid_operators
      SIMPLE_VALID_OPERATORS
    end

    def to_s
      ":#{@value}"
    end
  end
end
