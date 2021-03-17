# frozen_string_literal: true

class ImageObjectEntity < ApplicationEntity
  type 'ImageObject'
  attribute :url, ::IziJsonLd::Types::String.optional
end
