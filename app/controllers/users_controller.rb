# typed: true
# frozen_string_literal: true

# manage users of our system
class UsersController < ApplicationController
  extend T::Sig

  skip_before_action :authorize, only: %i[new create]

  def create
    @user = User.create(
      params
        .require_typed(:user, TA[ActionController::Parameters].new)
        .permit(:username, :password)
    )

    session[:user_id] = @user.id

    redirect_to '/'
  end
end
