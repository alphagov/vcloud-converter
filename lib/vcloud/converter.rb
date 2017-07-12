require_relative "converter/version"
require 'optparse'

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
    end
  end

  Vcloud::Converter.convert
end
