require "spec_helper"

RSpec.describe Vcloud::Converter do
  it "has a version number" do
    expect(Vcloud::Converter::VERSION).not_to be nil
  end

  it "converts 'vcloud-net_launcher' YAML to Terraform" do
    terraform_conversion = File.read('./spec/fixtures/vdc_networks.tf')
    expect { Vcloud::Converter.convert('vcloud-net_launcher', './spec/fixtures/vdc_networks.yaml') }.to output(terraform_conversion).to_stdout
  end
end
