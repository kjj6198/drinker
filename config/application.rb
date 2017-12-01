require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Drinker17
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Taipei"
    config.generators.assets = false
    config.generators.helper = false
    config.filestack_rails.api_key = ENV['FILE_STACK_API_KEY']
    config.filestack_rails.client_name = "drinker17"

  end
end
