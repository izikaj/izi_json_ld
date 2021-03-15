# frozen_string_literal: true

class ProductEntity < ApplicationEntity
  extra '@context', 'http://www.schema.org'
  extra '@type', 'Product'

  attribute :name, ::IziJsonLd::Types::String
  attribute? :brand, ::IziJsonLd::Types::String.optional
  attribute? :image, ::IziJsonLd::Types::String.optional
  attribute? :description, ::IziJsonLd::Types::String.optional

  attribute? :offers, OfferEntity.optional
  attribute? :aggregateRating, AggregateRatingEntity.optional
  attribute? :review, (::IziJsonLd::Types::Array.of(::ReviewEntity) | ::ReviewEntity).optional
end
