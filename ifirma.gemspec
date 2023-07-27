# -*- encoding: utf-8 -*-
# stub: ifirma 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "ifirma".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jaroslaw Wozniak".freeze]
  s.date = "2022-02-15"
  s.description = "API wrapper for ifirma.pl".freeze
  s.email = ["info@netkodo.com".freeze]
  s.files = [".gitignore".freeze, "Gemfile".freeze, "Rakefile".freeze, "ifirma.gemspec".freeze, "lib/ifirma.rb".freeze, "lib/ifirma/auth_middleware.rb".freeze, "lib/ifirma/response.rb".freeze, "lib/ifirma/version.rb".freeze, "lib/optima.rb".freeze, "lib/optima/optima_xml.rb".freeze, "spec/auth_spec.rb".freeze, "spec/invoices_spec.rb".freeze, "spec/spec_helper.rb".freeze]
  s.homepage = "http://www.netkodo.com".freeze
  s.rubygems_version = "3.0.8".freeze
  s.summary = "API wrapper for ifirma.pl".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.8.8"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, [">= 0.9.1"])
      s.add_runtime_dependency(%q<faraday-stack>.freeze, [">= 0.1.3"])
      s.add_runtime_dependency(%q<yajl-ruby>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 1.5.10"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.6"])
      s.add_development_dependency(%q<webmock>.freeze, [">= 1.7"])
    else
      s.add_dependency(%q<faraday>.freeze, ["~> 0.8.8"])
      s.add_dependency(%q<faraday_middleware>.freeze, [">= 0.9.1"])
      s.add_dependency(%q<faraday-stack>.freeze, [">= 0.1.3"])
      s.add_dependency(%q<yajl-ruby>.freeze, ["~> 1.0"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 1.5.10"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.6"])
      s.add_dependency(%q<webmock>.freeze, [">= 1.7"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["~> 0.8.8"])
    s.add_dependency(%q<faraday_middleware>.freeze, [">= 0.9.1"])
    s.add_dependency(%q<faraday-stack>.freeze, [">= 0.1.3"])
    s.add_dependency(%q<yajl-ruby>.freeze, ["~> 1.0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 1.5.10"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.6"])
    s.add_dependency(%q<webmock>.freeze, [">= 1.7"])
  end
end
