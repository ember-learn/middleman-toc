# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'middleman-toc/version'

Gem::Specification.new do |s|
  s.name        = "middleman-toc"
  s.version     = Middleman::Toc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Anton Fefilov"]
  s.email       = ["anton.fefilov@macrocoders.com"]
  s.homepage    = "https://github.com/macrocoders/middleman-toc"
  s.summary     = %q{TOC and Pagination Helpers for Middleman}
  s.description = %q{TOC and Pagination Helpers that can be useful for anyone writing book-style content}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency("middleman-core", ["~> 3.0"])
end
