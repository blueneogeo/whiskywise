# frozen_string_literal: true

# typed: true

# handles user sessions
class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def create
    @user = User.find_by(username: params[:username])

    if @user && T.unsafe(@user).authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def login; end

  def welcome; end

  def page_requires_login; end
end
