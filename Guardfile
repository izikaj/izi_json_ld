guard :rspec, cmd: 'bundle exec rspec', failed_mode: :focus do
  watch('spec/spec_helper.rb') { 'spec' }
  # watch('app/controllers/application_controller.rb')  { 'spec/controllers' }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$}) { |m| "spec/lib/#{m[1]}_spec.rb" }
end
