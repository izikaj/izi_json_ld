# frozen_string_literal: true

class ArticleEntity < ApplicationEntity
  type 'Article'

  attribute? :datePublished, ::IziJsonLd::Types::DateTime.optional
  attribute? :dateModified, ::IziJsonLd::Types::DateTime.optional
end
