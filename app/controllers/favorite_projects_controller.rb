class FavoriteProjectsController < ApplicationController
   
    def index
@favorite = current_user.username.favorite_projects
    end
  
  def create
    if Favorite.create(favorited: @project, user: current_user)
      redirect_to @project, notice: 'Project has been favorited'
    else
      redirect_to @project, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def new 
    @favorite = Favorite.new
  end
  def destroy
    Favorite.where(favorited_id: @project.id, user_id: current_user.id).first.destroy
    redirect_to @project, notice: 'Project is no longer in favorites'
  end
  

  private
  
    def favorite_project_params
        params.require(:favorite_project).permit(:user_id,:favorited_type,:favorited_id)
    end
end
