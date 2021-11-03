# frozen_string_literal: true

class ProductEntity < ApplicationEntity
  type 'Product'

  attribute :name, ::IziJsonLd::Types::String
  attribute? :brand, (::IziJsonLd::Types::Strict::String | ::OrganizationEntity).optional
  attribute? :image, ::IziJsonLd::Types::String.optional
  attribute? :description, ::IziJsonLd::Types::String.optional
  attribute? :sku, ::IziJsonLd::Types::String.optional
  attribute? :gtin, ::IziJsonLd::Types::String.optional
  attribute? :mpn, ::IziJsonLd::Types::String.optional

  attribute? :offers, OfferEntity.optional
  attribute? :aggregateRating, AggregateRatingEntity.optional
  attribute? :review, ::IziJsonLd::Types::OneOrMore[::ReviewEntity].optional

  def dump_attributes
    attributes.except(:brand).merge(
      brand: safe_brand
    )
  end

  private

  def safe_brand
    return if brand.blank?
    return brand unless brand.is_a?(String)

    ::OrganizationEntity.new(name: brand)
  end
end
