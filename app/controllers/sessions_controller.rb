class SessionsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:new, :create]

def create
  user = User.where(:email => params[:email]).first
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to sessions_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end



 def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :password_digest)
    end

end
