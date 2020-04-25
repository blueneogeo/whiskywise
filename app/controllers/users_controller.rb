# typed: true
# frozen_string_literal: true

# manage users of our system
class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def create
    # user_params = T.let(params.require(:user), T.untyped).permit(:username)
    @user = User.create(
      params
        .require_typed(:user, TA[ActionController::Parameters].new)
        .permit(:username)
    )

    session[:user_id] = @user.id

    @user = 10

    redirect_to '/welcome'
  end
end
