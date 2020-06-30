class EventsController < ApplicationController
    def show
        @event = Event.find(params[:id])
    end
    
    def new
    end
    
    def create
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:notice] = "Event created."
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def index
        @events = Event.all
    end
    
    private
    
    def event_params
        params.require(:event).permit(:description)
    end
end
