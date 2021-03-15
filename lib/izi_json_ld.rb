# frozen_string_literal: true

require 'izi_json_ld/version'
require 'pathname'

# core setup
module IziJsonLd
  class << self
    def configure
      yield self
    end
  end

  autoload :Types, 'izi_json_ld/types'

  class << self
    def root_path
      @root_path ||= Pathname.new(File.dirname(File.expand_path(__dir__)))
    end
  end
end

require 'izi_json_ld/engine'
