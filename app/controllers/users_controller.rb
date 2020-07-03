class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params.require(:user).permit(:name))
         @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome #{@user.name}"
            redirect_to user_path(@user)
    end
    
    def show
        @user = User.find(params[:id])
        @created_events = @user.events
        @events = @user.attended_events
        @upcoming_events = @created_events.future(Date.today)
        @previous_events = @created_events.past(Date.today)
    end
    
end
