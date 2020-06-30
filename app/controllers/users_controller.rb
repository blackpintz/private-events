class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params.require(:user).permit(:name))
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome #{@user.name}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
        @events = @user.events
    end
    
end
