# frozen_string_literal: true

module IziJsonLd
  module Types
    DateTime = Types::DateTime.constructor do |value|
      next value.to_datetime if value.respond_to?(:to_datetime)

      ::DateTime.parse(value) if value.is_a? String
    end
  end
end
