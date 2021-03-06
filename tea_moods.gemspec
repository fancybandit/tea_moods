require_relative 'lib/tea_moods/version'

Gem::Specification.new do |spec|
  spec.name          = "tea_moods"
  spec.version       = TeaMoods::VERSION
  spec.authors       = ["Jacob Klimenko"]
  spec.email         = ["droidedjake@gmail.com"]

  spec.summary       = %q{"This app will help you choose a tea based on a desired effect."}
  spec.description   = %q{"This app is designed to retrieve a user's input based on their desired mood/effect. The CLI will then display a set of teas pertaining to that effect that the user can select. Selecting a tea will display its description. At any time, a user may go back, list moods/teas again, or exit."}
  spec.homepage      = "https://github.com/fancybandit/tea_moods"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fancybandit/tea_moods"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "tty-table"
  spec.add_dependency "tty-box"
end
