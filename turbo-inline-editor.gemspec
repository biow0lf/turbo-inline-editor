# frozen_string_literal: true

require_relative "lib/turbo/inline/editor/version"

Gem::Specification.new do |spec|
  spec.name = "turbo-inline-editor"
  spec.version = Turbo::Inline::Editor::VERSION
  spec.authors = ["Ihor Zubkov"]
  spec.email = ["igor.zubkov@gmail.com"]

  spec.summary = "Turbo inline editor for Rails (best_in_place replacement for Turbo era)"
  spec.description = "Turbo inline editor for Rails (best_in_place replacement for Turbo era)"
  spec.homepage = "https://turbo-inline-editor.org"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/biow0lf/turbo-inline-editor"
  spec.metadata["changelog_uri"] = "https://github.com/biow0lf/turbo-inline-editor/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 7.0"
  spec.add_dependency "turbo-rails"

  spec.add_development_dependency "appraisal"
end
