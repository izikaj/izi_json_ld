require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'izi_json_ld'

module Dummy
  class Application < Rails::Application
    config.load_defaults(Rails::VERSION::STRING.to_f) if config.respond_to?(:load_defaults)

    config.time_zone = 'Eastern Time (US & Canada)'
    config.encoding = 'utf-8'
    config.assets.enabled = false
  end
end
