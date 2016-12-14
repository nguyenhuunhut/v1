require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KYCForm
  class Application < Rails::Application


    config.action_mailer.default_url_options = { :host => 'localhost:3000' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
       address:              'smtp.gmail.com',
       port:                 587,
       domain:               'gmail.com',
       user_name:            'nguyenhuunhut1@gmail.com',
       password:             'Nato~Paris0967769622',
       authentication:       'plain',
       enable_starttls_auto: true
    }


    config.active_record.raise_in_transactional_callbacks = true
    config.api_only = true
  end
end
