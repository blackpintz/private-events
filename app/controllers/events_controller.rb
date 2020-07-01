require 'date'
class EventsController < ApplicationController
    def show
        event = Event.find(params[:id])
        @attendees = event.attendees
    end
    
    def new
    end
    
    def create
        @event = current_user.events.build(event_params)
        @event[:date] = Date.today
        if @event.save
            flash[:notice] = "Event created."
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def index
        @events = Event.all
        @past_events = @events.past(Date.today)
        @future_events = @events.future(Date.today)
    end
    
    private
    
    def event_params
        params.require(:event).permit(:description)
    end
    
end
