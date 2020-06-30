class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params.require(:user).permit(:name))
        if @user.save
            flash[:notice] = "Welcome #{@user.name}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def show
    end
end
