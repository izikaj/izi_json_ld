# frozen_string_literal: true

class WebPageEntity < ApplicationEntity
  type 'WebPage'
  attribute :web_page, ::IziJsonLd::Types::String.optional

  def dump_attributes
    { '@id' => web_page }
  end
end
