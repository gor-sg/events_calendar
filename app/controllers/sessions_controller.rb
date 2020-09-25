class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if current_user
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or_default(user_url(user))
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
