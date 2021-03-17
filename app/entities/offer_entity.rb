# frozen_string_literal: true

class OfferEntity < ApplicationEntity
  type 'Offer'

  attribute :url, ::IziJsonLd::Types::Coercible::String
  attribute :price, ::IziJsonLd::Types::Coercible::Float
  attribute :priceCurrency, ::IziJsonLd::Types::String.optional.default('USD')
  attribute :availability, ::IziJsonLd::Types::String.optional.default('https://schema.org/OnlineOnly')
  attribute? :priceValidUntil, ::IziJsonLd::Types::DateTime.optional
end
