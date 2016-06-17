require 'simplecov'
require 'httparty'

class SimpleCov::Formatter::ShieldFormatter
  SHIELD_ROOT = 'http://img.shields.io/badge'.freeze
  STYLES = ['flat']

  @config = {
    :badge_name => 'coverage',
    :precision => 0,
    :style => nil,
    :file_format => 'svg',
  }

  def format(result)
    @result = result
    generate_shield
  end

  def generate_shield
    File.binwrite(shield_file_path, HTTParty.get(shield_url).parsed_response)
  end

  def shield_url
    url = "#{SHIELD_ROOT}/#{badge_name}-#{coverage_percent}%-#{color}.#{file_format}"
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
    "#{SimpleCov.coverage_path}/coverage.#{file_format}"
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
    define_method(key) { self.class.config[key] }
  end
end
