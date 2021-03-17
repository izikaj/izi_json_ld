# frozen_string_literal: true

class AggregateRatingEntity < RatingEntity
  type 'AggregateRating'

  attribute :reviewCount, ::IziJsonLd::Types::Coercible::Integer.optional.default(1)
end
