require_relative "converter/version"
require 'optparse'
require 'yaml'
require 'erb'

module Vcloud
  module Converter
    ARGV << '-h' if ARGV.empty?
    @options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: ruby converter.rb -t vcloud-net_launcher -p path/to/file.yaml"

      opts.on('-t', '--type TYPE', 'Type of YAML file for conversion.') { |v| @options[:type] = v }
      opts.on('-p', '--path PATH', 'Path to YAML file for conversion.') { |v| @options[:path] = v }

      opts.on_tail("-h", "--help", "Show this help message.") do
        puts opts
        exit
      end
    end.parse!

    def self.convert
      if @options[:type] == "vcloud-net_launcher"
        convert_vcloud_net_launcher(@options[:path])
      end
    end

    def self.convert_vcloud_net_launcher(file_path)
      vcloud_config = YAML.load_file(file_path)
      name = vcloud_config.first.first

      vcloud_config[name].each do |machine|
        vdc_name = machine["vdc_name"]
        edge_gateway = machine["edge_gateway"]
        gateway = machine["gateway"]
        netmask = machine["netmask"]
        dns1 = machine["dns1"]
        dns2 = machine["dns2"]
        dns_suffix = machine["dns_suffix"]

        start_address = machine["ip_ranges"][0]["start_address"]
        end_address = machine["ip_ranges"][0]["end_address"]

        puts ERB.new(File.read("./templates/vcd_networks.tf.erb")).result(binding)
      end
    end
  end

  Vcloud::Converter.convert
end
