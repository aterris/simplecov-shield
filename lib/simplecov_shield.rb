# gems
require 'bundler'
Bundler.require(:default)

module SimpleCov::Formatter
  class ShieldFormatter
    VERSION = '0.0.1'
    SHIELD_ROOT = 'http://img.shields.io/badge/'

    @@config = {
      :badge_name => 'coverage',
      :precision => 0,
      :style => nil,
    }

    def self.config
      @@config
    end

    def format(result)
      @coverage_percent = coverage_percent(result)

      generate_shield
    end

    private
    def generate_shield
      File.open(shield_file_path, 'w') do |file|
        file.write HTTParty.get(shield_url).parsed_response
      end
    end

    def shield_url
      "#{SHIELD_ROOT}/#{config[:badge_name]}-#{@coverage_percent}%-#{color}.svg"
    end

    def shield_file_path
      "#{SimpleCov.coverage_path}/coverage.svg"
    end

    def coverage_percent(result)
      result.covered_percent.round(config[:precision])
    end

    def color
      case @coverage_percent
      when 90..100
        'brightgreen'
      when 80..89
        'yellow'
      else
        'red'
      end
    end

  end
end