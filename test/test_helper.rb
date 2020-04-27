# typed: strict
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'
require 'capybara/minitest/spec'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Make the Capybara DSL and Minitest DSL available in all integration tests
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Node::Matchers
  include Capybara::Minitest::Assertions

  setup do
    Capybara.default_driver = :selenium_chrome_headless
  end

  # Reset sessions and driver between tests
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
