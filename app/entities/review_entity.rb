# frozen_string_literal: true

class ReviewEntity < ApplicationEntity
  extra '@type', 'Review'

  attribute? :author, ::IziJsonLd::Types::String.optional
  attribute? :reviewRating, RatingEntity.optional
  attribute? :reviewBody, ::IziJsonLd::Types::String.optional

  attribute? :datePublished, (::IziJsonLd::Types::Nominal::Date | ::IziJsonLd::Types::JSON::Date).optional
end
