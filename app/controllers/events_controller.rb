class EventsController < ApplicationController

    layout "app_layout"
    # Events controller complete. Only 2 methods will be required for this controller

    def index
        
        # note: turbo links -> helps load pages faster, but sometimes does not 

        # if the params[:q] exists we do a search 
            if (params[:q])
                @events = Event.search_item(params[:q])
        # else , return all of the events
            else
                @events = Event.all
            end
    end

    def show 
        @event = Event.find(params[:id])
    end

    def event_params
        params.permit(:q)
    end

end