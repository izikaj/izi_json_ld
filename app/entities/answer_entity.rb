# frozen_string_literal: true

class AnswerEntity < ApplicationEntity
  type 'Answer'

  attribute :text, ::IziJsonLd::Types::String
end
