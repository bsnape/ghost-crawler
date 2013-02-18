# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghost-crawler/version'

Gem::Specification.new do |gem|
  gem.name = 'ghost-crawler'
  gem.version = GhostCrawler::VERSION
  gem.authors = ['Ben Snape']
  gem.email = ['ben.snape@itv.com']
  gem.description = %q{Headless PhantomJS Crawler}
  gem.summary = %q{A site crawler that uses GhostDriver (part of PhantomJS)}
  gem.homepage = 'http://www.bensnape.com'

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency('selenium-webdriver')
  gem.add_dependency('rspec')

  gem.add_development_dependency('rake')
end
