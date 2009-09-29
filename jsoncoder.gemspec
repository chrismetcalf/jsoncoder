# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jsoncoder}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Metcalf"]
  s.date = %q{2009-09-28}
  s.default_executable = %q{jsoncoder.rb}
  s.email = %q{chris.metcalf@socrata.com}
  s.executables = ["jsoncoder.rb"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "bin/jsoncoder.rb",
    "lib/jsoncoder.rb",
    "test/jsoncoder_test.rb",
    "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/chrismetcalf/jsoncoder}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/jsoncoder_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
