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
end
private
    def list_params
        params.require(:list).permit(:user_id,:product,:store,:price,:search)
    end
