require_relative 'boot'

require 'rails/all'
# require 'amazon/ecs'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyBook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.autoload_paths += Dir["#{config.root}/app/validators"]
  end
end

# Amazon::Ecs.configure do |options|
#   options[:AWS_access_key_id] = Rails.application.credentials[:pa_api][:access_key_id]
#   options[:AWS_secret_key] = Rails.application.credentials[:pa_api][:secret_key]
#   options[:associate_tag] = Rails.application.credentials[:pa_api][:associate_tag]
# end
