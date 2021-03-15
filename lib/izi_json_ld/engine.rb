# frozen_string_literal: true

require 'dry-struct'

module IziJsonLd
  class Engine < ::Rails::Engine
    engine_name 'izi_json_ld'

    require_relative 'extentions/autoload_paths'
  end
end
