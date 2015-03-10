class SessionsController < ApplicationController
  def login
    #Login Form
  end
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id]= authorized_user.user_id
      session[:username]=authorised_user.username
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
    
      redirect_to(:action => 'home') 
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end
  def logout
  	session[:user_id]= nil
      session[:username]= nil
      redirect_to(:action => "login")
  end

  def home
  	#game page
  	redirect_to("")
  end
end