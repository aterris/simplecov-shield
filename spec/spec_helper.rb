# encoding: utf-8

require 'bundler'
Bundler.require(:default, :development)

#lib = File.expand_path('../../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

#require 'lib/simplecov_shield'
require 'simplecov'
require File.expand_path('../../lib/simplecov_shield', __FILE__)

HELPER_FILE_PATH = File.expand_path('../assets', __FILE__)

RSpec.configure do |config|
  # Spec Filtering
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # Output
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
end
