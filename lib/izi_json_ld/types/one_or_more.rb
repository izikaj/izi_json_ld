# frozen_string_literal: true

module IziJsonLd
  module Types
    class OneOrMore
      class << self
        def [](entry)
          Types::Strict::Array.of(entry) | entry
        end
      end
    end
  end
end
