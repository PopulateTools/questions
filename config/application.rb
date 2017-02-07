require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module QuestionsMachine
  class Application < Rails::Application
    config.generators do |g|
      g.orm            :active_record
      g.assets         false
      g.helper         false
      g.routes         false
      g.test_framework :minitest, spec: false, fixture: true
    end
  end
end
