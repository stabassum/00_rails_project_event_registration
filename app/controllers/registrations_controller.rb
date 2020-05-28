class RegistrationsController < ApplicationController

    layout "app_layout"

    before_action :authentication_required

    def index
        # @registrations = Registration.all
        if !params[:user].blank?
            @registrations = Registration.by_user(params[:user])
        elsif params[:user_id]
            # filters to the users only
            @registrations = User.find(params[:user_id]).registrations
        else

            # if no filters are applied, show all posts
            @registrations = Registration.all
        end

    end

    def show
        @registration = Registration.find(params[:id])
    end

    def new
        @registration = Registration.new(user_id: params[:user_id])
    end

    def create
        @registration = Registration.new(registration_params(:task_category, :task_descriptions, :shirt_size, :user_id, :event_id))
        if @registration.valid?
            @registration.save
            redirect_to registration_path(@registration) 
        else
            render :new
        end
    end

    def edit 
        @registration = Registration.find(params[:id])
    end

    def update
        @registration = Registration.find(params[:id])
        
        if @registration.update(registration_params(:task_category, :task_descriptions, :shirt_size, :event_id))
            redirect_to registration_path(@registration)
        else
            render :edit
        end
    end

    def destroy
        @registration = Registration.find(params[:id]).destroy
        
        redirect_to registrations_url
    end

    def registration_params(*args)
        params.require(:registration).permit(*args)
    end

end