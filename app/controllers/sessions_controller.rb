# frozen_string_literal: true

# typed: true

# handles user sessions
class SessionsController < ApplicationController
  extend T::Sig

  skip_before_action :authorize, only: %i[new create welcome]

  def create
    @user = User.find_by(username: params[:username])

    if @user && T.unsafe(@user).authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def login; end

  def home; end

  def page_requires_login; end
end
