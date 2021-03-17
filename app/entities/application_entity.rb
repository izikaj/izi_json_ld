# frozen_string_literal: true

class ApplicationEntity < Dry::Struct
  transform_keys(&:to_sym)
  delegate :extras, to: :class
  delegate :as_json, to: :dump

  DEFAULT_CONTEXT = 'https://schema.org'

  class << self
    def extras
      @extras ||= {}
    end

    def extra(key, value)
      extras[key] = value
    end

    def type(value)
      extra('@type', value)
    end
  end

  def to_h
    dump
  end

  def to_json(*args)
    super.html_safe
  end

  def dump(ref = nil)
    @dump ||= build_extras(ref).merge(dump_attributes)
  end

  private

  def build_extras(ref)
    data = {}

    data['@context'] = DEFAULT_CONTEXT unless context? || same?(ref, '@context')

    extras.merge(data)
  end

  def context?
    extras['@context'].present?
  end

  def same?(ref, at_key = '@context')
    return false if ref.nil?

    ref.extras.fetch(at_key, nil) == extras.fetch(at_key, nil)
  end

  def dump_attributes
    attributes.each_with_object({}) do |(key, val), result|
      result[key] = dump_value(val)
    end
  end

  def dump_value(data)
    case data
    when ApplicationEntity
      return data.dump(self)
    when Array
      return data.map { |i| i.dump(self) } if data.first.is_a?(ApplicationEntity)
    end

    data
  end
end
