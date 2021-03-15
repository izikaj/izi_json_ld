# frozen_string_literal: true

class ApplicationEntity < Dry::Struct
  transform_keys(&:to_sym)
  delegate :extras, to: :class
  delegate :as_json, to: :dump

  class << self
    def extras
      @extras ||= {}
    end

    def extra(key, value)
      extras[key] = value
    end
  end

  def to_h
    extras.merge(super)
  end

  def to_json(*args)
    super.html_safe
  end

  def dump
    @dump ||= extras.merge(dump_attributes)
  end

  private

  def dump_attributes
    attributes.each_with_object({}) do |(key, val), result|
      result[key] = dump_value(val)
    end
  end

  def dump_value(data)
    case data
    when ApplicationEntity
      return data.dump
    when Array
      return data.map(&:dump) if data.first.is_a?(ApplicationEntity)
    end

    data
  end
end
