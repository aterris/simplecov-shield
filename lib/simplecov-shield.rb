# encoding: utf-8

require 'simplecov'
require 'httparty'

module SimpleCov::Formatter
  class ShieldFormatter
    SHIELD_ROOT = 'http://img.shields.io/badge'
    STYLES = ['flat']

    @config = {
      :badge_name => 'coverage',
      :precision => 0,
      :style => nil,
    }

    def format(result)
      @result = result
      generate_shield
    end

    def generate_shield
      File.open(shield_file_path, 'w') do |file|
        file.write HTTParty.get(shield_url).parsed_response
      end
    end

    def shield_url
      url = "#{SHIELD_ROOT}/#{badge_name}-#{coverage_percent}%-#{color}.svg"
      url += "?style=#{style}" if STYLES.include? style

      URI.encode(url)
    end

    def coverage_percent
      @coverage_percent ||= @result.covered_percent.round(precision)
    end

    def self.config
      @config
    end

    private
    def shield_file_path
      "#{SimpleCov.coverage_path}/coverage.svg"
    end

    def color
      case coverage_percent
      when 90..100
        'brightgreen'
      when 80..89
        'yellow'
      else
        'red'
      end
    end

    @config.each do |key, val|
      define_method(key) { ShieldFormatter.config[key] }
    end

  end
end