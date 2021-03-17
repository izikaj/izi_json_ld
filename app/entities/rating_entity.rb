# frozen_string_literal: true

class RatingEntity < ApplicationEntity
  type 'Rating'

  attribute :bestRating, ::IziJsonLd::Types::Coercible::Float.optional.default(5)
  attribute :worstRating, ::IziJsonLd::Types::Coercible::Float.optional.default(1)
  attribute :ratingValue, ::IziJsonLd::Types::Coercible::Float
end
