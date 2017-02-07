ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "database_cleaner"

Time.zone = "UTC"
ActiveRecord::Migration.maintain_test_schema!

class ActiveSupport::TestCase
  fixtures :all
  self.use_transactional_tests = true
end

class ActionDispatch::IntegrationTest
  require "minitest/rails/capybara"
  require "capybara/poltergeist"

  include Capybara::DSL

  Capybara.register_driver :poltergeist_custom do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      timeout: 300,
      inspector: ENV["INTEGRATION_INSPECTOR"] == "true",
      debug: ENV["INTEGRATION_DEBUG"] == "true",
      window_size: [1920, 1080]
    )
  end

  Capybara.javascript_driver = :poltergeist_custom
  Capybara.default_host = "http://questions-machine.dev"

  self.use_transactional_tests = false

  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with :truncation

  def setup
    DatabaseCleaner.start
    Capybara.current_driver = Capybara.javascript_driver
  end

  def teardown
    DatabaseCleaner.clean
    Capybara.reset_session!
  end

  def with_hidden_elements
    Capybara.ignore_hidden_elements = false
    yield
  ensure
    Capybara.ignore_hidden_elements = true
  end
end
