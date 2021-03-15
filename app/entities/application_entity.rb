# frozen_string_literal: true

class ApplicationEntity < Dry::Struct
  transform_keys(&:to_sym)
  delegate :extras, to: :class
  delegate :as_json, to: :to_h

  def to_h
    extras.merge(super)
  end

  def to_json(*args)
    super.html_safe
  end

  class << self
    def extras
      @extras ||= {}
    end

    def extra(key, value)
      extras[key] = value
    end
  end
end
