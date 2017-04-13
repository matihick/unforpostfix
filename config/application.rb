require_relative 'boot'

require 'rails/all'
require 'csv'
require 'timeout'
require 'yaml'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Unforpostfix
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Buenos Aires'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:es, :en]
    config.i18n.default_locale = :es
    config.i18n.locale = :es
    config.i18n.enforce_available_locales = true

    ActiveSupport.halt_callback_chains_on_return_false = false
  end
end

