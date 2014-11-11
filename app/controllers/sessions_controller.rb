class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.username}"
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Username or password not recognized."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out."
    redirect_to root_path
  end
end
