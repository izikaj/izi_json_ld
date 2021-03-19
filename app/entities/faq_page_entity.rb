# frozen_string_literal: true

class FaqPageEntity < ApplicationEntity
  type 'FAQPage'

  attribute :mainEntity, ::IziJsonLd::Types::OneOrMore[::QuestionEntity]
  attribute? :breadcrumb, ::BreadcrumbListEntity
end
