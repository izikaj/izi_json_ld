# frozen_string_literal: true

class ArticleEntity < ApplicationEntity
  type 'Article'

  attribute :headline, ::IziJsonLd::Types::String.optional
  attribute? :mainEntityOfPage, ::IziJsonLd::Types::Strict::String | ::WebPageEntity

  attribute? :image, ::IziJsonLd::Types::String.optional
  attribute? :description, ::IziJsonLd::Types::String.optional
  attribute? :author, (PersonEntity | OrganizationEntity).optional
  attribute? :publisher, (PersonEntity | OrganizationEntity).optional

  attribute? :datePublished, ::IziJsonLd::Types::DateTime.optional
  attribute? :dateModified, ::IziJsonLd::Types::DateTime.optional
end
