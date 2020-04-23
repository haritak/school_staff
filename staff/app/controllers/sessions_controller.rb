class SessionsController < ApplicationController

  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in"
    else
      redirect_to root_url, alert: "Wrong credentials"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
