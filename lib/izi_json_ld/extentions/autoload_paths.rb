# frozen_string_literal: true

# isolate_namespace IziJsonLd
::IziJsonLd::Engine.config.autoload_paths += %W[
  #{IziJsonLd.root_path}/app/helpers
]
