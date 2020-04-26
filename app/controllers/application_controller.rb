# typed: true

# frozen_string_literal: true

# the controller that is the base for all controllers in the application
class ApplicationController < ActionController::Base
  before_action :authorize

  def initialize
    @presenter = ::ApplicationPresenter.new(self)
  end

  sig { returns(T.nilable(User)) }
  def current_user
    User.find_by(id: session[:user_id])
  end

  sig { returns(T::Boolean) }
  def logged_in?
    !current_user.nil?
  end

  private

  def authorize
    redirect_to '/welcome' unless logged_in?
  end
end
