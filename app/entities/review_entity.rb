# frozen_string_literal: true

class ReviewEntity < ApplicationEntity
  type 'Review'

  # attribute? :author, ::IziJsonLd::Types::String.optional
  attribute? :author, (::IziJsonLd::Types::Strict::String | ::PersonEntity | ::OrganizationEntity).optional
  attribute? :reviewRating, RatingEntity.optional
  attribute? :reviewBody, ::IziJsonLd::Types::String.optional

  attribute? :datePublished, ::IziJsonLd::Types::DateTime.optional

  def dump_attributes
    attributes.except(:author).merge(author: safe_author)
  end

  private

  def safe_author
    return if author.blank?
    return author unless author.is_a? String

    PersonEntity.new(person_name: author)
  end
end
