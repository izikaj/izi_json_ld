# frozen_string_literal: true

class PersonEntity < ApplicationEntity
  type 'Person'
  attribute :person_name, ::IziJsonLd::Types::String
  attribute? :email, ::IziJsonLd::Types::String.optional
  attribute? :image, ::IziJsonLd::Types::String.optional
  attribute? :sameAs, ::IziJsonLd::Types::String.optional
  attribute? :worksFor, ::OrganizationEntity

  def dump_attributes
    attributes.except(:person_name).merge(name: person_name)
  end
end
