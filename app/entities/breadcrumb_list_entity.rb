# frozen_string_literal: true

class BreadcrumbListEntity < ApplicationEntity
  type 'BreadcrumbList'

  attribute :itemListElement, ::IziJsonLd::Types::OneOrMore[::ListItemEntity]
end
