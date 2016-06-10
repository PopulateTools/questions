require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    config.time_zone = 'UTC'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es
    config.i18n.available_locales = [:es, :en]

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.assets          false
      g.helper          false
      g.routes          false
      g.test_framework  :rspec, fixtures: false, view_spec: false,
        helper_specs: false, routing_specs: false,
        controller_specs: false, request_specs: false
    end

    # Set the default host name for emails
    # config.action_mailer.default_url_options = { host: '' }

    # Autoloading
    config.autoload_paths += [
      "#{config.root}/lib",
      "#{config.root}/lib/validators"
    ]

  end
end
