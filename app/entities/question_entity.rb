# frozen_string_literal: true

class QuestionEntity < ApplicationEntity
  type 'Question'

  attribute :name, ::IziJsonLd::Types::String
  attribute? :acceptedAnswer, ::AnswerEntity
  attribute? :answer, ::IziJsonLd::Types::String

  def dump_attributes
    attributes.except(:answer).merge(acceptedAnswer: safe_answer.dump(self))
  end

  private

  def safe_answer
    acceptedAnswer || ::AnswerEntity.new(text: answer)
  end
end
