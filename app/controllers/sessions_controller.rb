class SessionsController < ApplicationController
  skip_before_filter :signed_in_user, :except => [:destroy]

  def index
    redirect_to root_url
  end
  
  def new
  end

  def create
    user = User.unscoped.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.status == :New
        redirect_to signin_path, :notice => "Please confirm your registration from email"
      elsif user.status == :Active          
        if params[:session][:remember_me]
          cookies.permanent[:remember_me_token] = user.remember_me_token
        else
          cookies[:remember_me_token] = user.remember_me_token
        end
        sign_in user
        redirect_to root_url, :notice => "Logged in!"
      else
        redirect_to signin_path, :notice => "Your account has been disabled. Please contact your administrator"
      end
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:remember_me_token)
    sign_out
    redirect_to root_url, :notice => "Logged out!"
  end
end
