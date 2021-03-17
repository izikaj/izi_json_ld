# frozen_string_literal: true

module IziJsonLd
  module Types
    include Dry.Types()

    autoload :DateTime, 'izi_json_ld/types/date_time'
    autoload :OneOrMore, 'izi_json_ld/types/one_or_more'
  end
end
