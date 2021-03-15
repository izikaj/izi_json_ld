# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'izi_json_ld/version'

Gem::Specification.new do |s|
  s.name = 'izi_json_ld'
  s.version = IziJsonLd::VERSION.dup
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.summary = 'Izi Lightup'
  s.description = 'Utils to speed up page load by using critical css &
                  deferred scripts initialization'
  s.authors = ['IzikAJ']
  s.email = 'izikaj@gmail.com'
  s.homepage = 'https://bitbucket.org/netfixllc/izi_json_ld'

  s.files = Dir['{app,config,lib}/**/*'] + ['README.rdoc']
  s.test_files = Dir['{spec}/**/*']
  s.require_paths = ['lib']

  s.add_runtime_dependency('dry-struct')
  s.add_development_dependency('rspec')
end
