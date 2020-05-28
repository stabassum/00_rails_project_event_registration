class SiteController < ApplicationController

  # this will specify to use the formatting in app/views/layouts/app_layout.html.erb
  layout "app_layout"

  def index
    # @user = User.find(params[:user_id])
    # render :plain => "This is the startpoint of the site"
    if current_user
      @user = current_user
      # render :plain => "a user is logged in"
      redirect_to user_path(@user)
      # render 'homeapp'
    end
  end

  def homeapp
    if !current_user
      redirect_to root_path
    end
  end
end
