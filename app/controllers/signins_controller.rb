class SigninsController < ApplicationController
    def new
    end
    
    def create
        render plain: params[:Welcome!].inspect
    end
end
