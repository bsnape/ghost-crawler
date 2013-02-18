require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'Execute all passing rspec tests in CI'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.ruby_opts = '-I lib'
  t.rspec_opts = '--format documentation'
end

task :default => :spec
