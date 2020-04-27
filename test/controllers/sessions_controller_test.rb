# typed: true

require 'test_helper'
require 'capybara/rails'
require 'capybara/minitest'
require 'capybara/minitest/spec'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  extend T::Sig

  def test_can_log_in_and_out
    # check homepage
    visit('/')
    
    assert_button('Log out')

    
    
    # should not be logged in
    # expect(page).has_content('Log in')
    click_button 'Log in'
    # expect(page)
  end
end
