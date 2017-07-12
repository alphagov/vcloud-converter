require "vcloud/converter/version"
require "yaml"
require "erb"

module Vcloud
  module Converter
    def self.convert(conversion_type, file_path)
      if conversion_type == "vcloud-net_launcher"
        convert_vcloud_net_launcher(file_path)
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
end
