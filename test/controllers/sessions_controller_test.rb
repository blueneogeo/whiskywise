# typed: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  extend T::Sig

  def test_signup_and_login_flow
    # check homepage, still logged out
    visit '/'
    assert_button 'Log in'
    assert_button 'Sign up'
    assert_no_button 'Log out'

    # create user
    click_button 'Sign up'
    fill_in 'Username', with: 'John'
    fill_in 'Password', with: 'testing123'
    click_button 'Save User'

    # we should be back at the homepage, logged in
    assert_current_path '/'
    assert_button 'Log out'

    # now log out
    click_button 'Log out'
    assert_button 'Log in'
    assert_button 'Sign up'
    assert_no_button 'Log out'

    # and try to log in
    click_button 'Log in'
    fill_in 'Username', with: 'John'
    fill_in 'Password', with: 'testing123'
    click_button 'Login'

    # we should be back at the homepage, logged in
    assert_current_path '/'
    assert_button 'Log out'
  end
end
