class ListsController < ApplicationController
    def index
        @lists = List.all
        @lists = List.search(params[:search])
    end
    def show
        @list = List.find(params[:id])
    end
    def new 
    end
    
    def create
        @list = List.new(list_params)
        @list.user = current_user
    if @list.save
        redirect_to @list
    else
        render 'new'
    end
    end
    def edit
        @list = List.find(params[:id]) 
    end
    def update 
        @list = List.find(params[:id]) 
        if @list.update(list_params) 
            redirect_to @list 
        else 
            render 'edit' 
        end 
    end
    def destroy  
        @list = List.find(params[:id])
        @list.destroy
        
        redirect_to lists_path 
    end 
    
    def favorite_project
        @list = List.find(params[:id]) 
    type = params[:favorited_type]
    if type == "favorite"
      current_user.favorite_projects << @list
      redirect_to controller: 'lists'

    elsif type == "unfavorite"
      current_user.favorite_projects.delete(@list)
      redirect_to controller: 'lists'
     
    else
      # Type missing, nothing happens
      redirect_to controller: 'lists'
    end
  end
end
private
    def list_params
        params.require(:list).permit(:user_id,:product,:store,:price,:search)
    end
