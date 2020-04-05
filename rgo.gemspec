require_relative 'lib/rgo/version'

Gem::Specification.new do |spec|
  spec.name          = "rgo-lang"
  spec.version       = Rgo::VERSION
  spec.authors       = ["Mohsen Alizadeh"]
  spec.email         = ["mohsen@alizadeh.us"]

  spec.summary       = %q{ruby like programming langauge}
  spec.description   = %q{syntax by Ruby, performance by Go}
  spec.homepage      = "https://github.com/mohsen-alizadeh/rgo-lang"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = "https://github.com/mohsen-alizadeh/rgo-lang"
  spec.metadata["changelog_uri"]    = "https://github.com/mohsen-alizadeh/rgo-lang"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "racc", "~> 1.4.16"
end
