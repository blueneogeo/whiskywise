# frozen_string_literal: true

# typed: true

# handles user sessions
class SessionsController < ApplicationController
  extend T::Sig

  skip_before_action :authorize, only: %i[home new create welcome]

  def create
    @user = User.find_by(username: params[:username])

    if @user && T.unsafe(@user).authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def login; end

  def home
    redirect_to '/welcome' unless logged_in?
  end

  def welcome; end
end
