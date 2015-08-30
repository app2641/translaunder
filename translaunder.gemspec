# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'translaunder/version'

Gem::Specification.new do |gem|
  gem.name          = "translaunder"
  gem.version       = TransLaunder::VERSION
  gem.authors       = ["app2641"]
  gem.email         = ["app2641@gmail.com"]
  gem.summary       = %q{Google翻訳の結果をロンダリングします}
  gem.description   = %q{ リクエストしたテキストをGoogle翻訳で複数回翻訳して表示します }
  gem.homepage      = "http://github.com/app2641/translaunder"
  gem.files         = `git ls-files`.split("\n")
  gem.executables   = ['translaunder']
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "coveralls"
  gem.add_development_dependency "nyan-cat-formatter"
end
