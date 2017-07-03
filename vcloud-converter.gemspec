# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vcloud/converter/version"

Gem::Specification.new do |spec|
  spec.name          = "vcloud-converter"
  spec.version       = Vcloud::Converter::VERSION
  spec.authors       = ["GOV.UK Infrastructure"]
  spec.email         = ["vcloud-tools@digital.cabinet-office.gov.uk"]
  spec.summary       = 'Convert your vCloud Tools manifests to Terraform'
  spec.description   = 'Convert your vCloud Tools manifests to Terraform'
  spec.homepage      = 'http://github.com/alphagov/vcloud-converter'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin/"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.6"
end
