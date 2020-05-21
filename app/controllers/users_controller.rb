# typed: true
# frozen_string_literal: true

# manage users of our system
class UsersController < ApplicationController
  extend T::Sig

  skip_before_action :authorize, only: %i[new create]

  def create
    @user = User.create(user_params)

    session[:user_id] = @user.id

    redirect_to '/'
  end
  
  private
  def user_params
    params
        .require_typed(:user, TA[ActionController::Parameters].new)
        .permit(:username, :password)
  end
end
