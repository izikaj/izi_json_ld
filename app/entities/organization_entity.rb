# frozen_string_literal: true

class OrganizationEntity < ApplicationEntity
  type 'Organization'
  attribute :name, ::IziJsonLd::Types::String.optional
  attribute? :url, ::IziJsonLd::Types::String.optional
  attribute? :email, ::IziJsonLd::Types::String.optional
  attribute? :telephone, ::IziJsonLd::Types::String.optional
  attribute? :logo, ImageObjectEntity.optional
end
