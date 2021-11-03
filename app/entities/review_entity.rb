# frozen_string_literal: true

class ReviewEntity < ApplicationEntity
  type 'Review'

  attribute? :author, (::IziJsonLd::Types::Strict::String | ::PersonEntity | ::OrganizationEntity).optional
  attribute? :publisher, (::IziJsonLd::Types::Strict::String | ::PersonEntity | ::OrganizationEntity).optional
  attribute? :reviewRating, RatingEntity.optional
  attribute? :reviewBody, ::IziJsonLd::Types::String.optional

  attribute? :datePublished, ::IziJsonLd::Types::DateTime.optional

  def dump_attributes
    attributes.except(:author, :publisher).merge(
      author: safe_author,
      publisher: safe_publisher
    )
  end

  private

  def safe_author
    return if author.blank?
    return author unless author.is_a?(String)

    ::PersonEntity.new(person_name: author)
  end

  def safe_publisher
    return if publisher.blank?
    return publisher unless publisher.is_a?(String)

    ::OrganizationEntity.new(name: publisher)
  end
end
