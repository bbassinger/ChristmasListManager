class UsersController < ApplicationController
#skip_before_action :authorized, only: [:new, :create]
def new
   @user = User.new
end
def create
   @user = User.new(user_params)
   #if (params[:password] != params[:password_confirmation])
   if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User created."
      redirect = '/lists/new'
   else
      flash[:danger] = "Passwords are not the same!"
      redirect = '/users/new'
   end
      redirect_to redirect
end

private

   def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :password_confirmation)
   end
end