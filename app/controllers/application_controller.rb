# typed: true
# frozen_string_literal: true

# the controller that is the base for all controllers in the application
class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user, :logged_in?, :name

  sig { returns(T.nilable(User)) }
  def current_user
    User.find_by(id: session[:user_id])
  end

  def name
    'Christian'
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end
end
