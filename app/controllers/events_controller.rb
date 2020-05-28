class EventsController < ApplicationController

    layout "app_layout"
    # Events controller complete. Only 2 methods will be required for this controller

    def index
        @events = Event.all
    end

    def show 
        @event = Event.find(params[:id])
    end

end