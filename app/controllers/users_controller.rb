class UsersController < ApplicationController
#skip_before_action :authorized, only: [:new, :create]
def new
   @user = User.new
end
def create
   if(:password != :password_confirmation)
      redirect = '/users/new'
      flash[:success] = "Passwords are not the same!"
   else
      @user = User.create(params.require(:user).permit(:username,        
   :password))
      session[:user_id] = @user.id
      redirect = '/welcome'
   end
   redirect_to redirect
end
end