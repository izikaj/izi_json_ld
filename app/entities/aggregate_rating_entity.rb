# frozen_string_literal: true

class AggregateRatingEntity < RatingEntity
  extra '@type', 'AggregateRating'

  attribute :reviewCount, ::IziJsonLd::Types::Coercible::Integer.optional.default(1)
end
