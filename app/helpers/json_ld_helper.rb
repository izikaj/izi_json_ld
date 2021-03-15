# frozen_string_literal: true

module JsonLdHelper
  def json_ld_tag(entity = nil)
    content_tag(:script, entity.to_json, type: 'application/ld+json')
  end
end
