# frozen_string_literal: true

class ListItemEntity < ApplicationEntity
  type 'ListItem'

  attribute :name, ::IziJsonLd::Types::String
  attribute? :position, ::IziJsonLd::Types::Coercible::Integer.optional
  attribute? :item, ::IziJsonLd::Types::String.optional
end
