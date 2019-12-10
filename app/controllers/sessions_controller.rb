class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])

        session[:user_id] = user.id 

        redirect_to root_url, notice: "Logged in test!"

    
    else
    flash.now[:alert] = "Username or password is invalid. Try again!"
    render "new"
    end
  end

  def login
  end

  def welcome
  end
  
   def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have been logged out."
   end
  def index
  @lists = List.all
  
  end

end
