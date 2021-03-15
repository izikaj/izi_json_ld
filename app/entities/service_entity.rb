# frozen_string_literal: true

class ServiceEntity < ApplicationEntity
  extra '@context', 'http://www.schema.org'
  extra '@type', 'Service'

  attribute :name, ::IziJsonLd::Types::String
  attribute? :review, ::ReviewEntity.optional
  attribute? :reviews, ::IziJsonLd::Types::Array.of(::ReviewEntity).optional
end
