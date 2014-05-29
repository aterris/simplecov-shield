# encoding: utf-8
Bundler.require(:default, :test)

require 'lib/simplecov-shield'

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
