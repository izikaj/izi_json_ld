# frozen_string_literal: true

class ReviewEntity < ApplicationEntity
  extra '@type', 'Review'

  attribute? :author, ::IziJsonLd::Types::String.optional
  attribute? :description, ::IziJsonLd::Types::String.optional
  attribute? :reviewRating, RatingEntity.optional

  attribute? :datePublished, (::IziJsonLd::Types::Nominal::Date | ::IziJsonLd::Types::JSON::Date).optional
end
