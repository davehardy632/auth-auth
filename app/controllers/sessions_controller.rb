class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.authenticate(params[:email_address], params[:password])
    if user == nil
      redirect_to login_path
    else
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.full_name}, you are logged in!"
      redirect_to users_path
    end
  end

  def destroy
    user = User.find(session[:user_id])
    session.clear
    redirect_to users_path
  end
end
