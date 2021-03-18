# frozen_string_literal: true

class WebPageEntity < ApplicationEntity
  type 'WebPage'
  attribute :web_page, ::IziJsonLd::Types::String.optional
  attribute? :breadcrumb, ::IziJsonLd::Types::String.optional

  def dump_attributes
    attributes.except(:web_page).merge('@id' => web_page)
  end
end
