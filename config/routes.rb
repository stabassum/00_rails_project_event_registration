Rails.application.routes.draw do

  # This is the page your app will display when you go to the root URL
  root 'site#index' # this uses the "#" notation
  get 'site/index'  # this uses the "/" notation - it's interchangeable with the one above

  # These are the routes used to manage users
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"

  # go to this video here: https://www.youtube.com/watch?v=UAvuo-EbTFY
  # look at this part of the video: 6:12 / 56:18 (timestamp)
  # at the 6:51 mark, Avi sets the "Authorization callback URL" (in his newly created OAuth GitHub app) to the following:
  # http://localhost:3000/auth/github/callback
  # the get request below must match the "Authorization callback URL" you specify in the GitHub OAuth app.
  get '/auth/:provider/callback' => 'sessions#create'
  # You can create a new OAuth (same thing as OmniAuth) on GitHub by going here: https://github.com/settings/developers

  # The second part of this OmniAuth business is to go to this directory: config/initializers
  # and create a file called "omniauth.rb"
  # WARNING WARNING WARNING - this "omniauth.rb" file will contain sensitive data, so if you haven't done so already, you first need to create
  # a ".gitignore" file in the root directory and then specifically include this file: config/initializers/omniauth.rb
  # INFO INFO INFO - If you're using this Rails app as a starting point for your Rails project, relax, the ".gitignore" has already been created for you,
  # and it includes the "config/initializers/omniauth.rb" - this means no sensitive data will be compromised.

  # In this project there is a file here: config/initializers/omniauth_boilerplate.rb
  # Go there next & follow instructions to setup OmniAuth-GitHub

  # resources :users

  # This route grabs the homepage for the actual app you're building
  get '/homeapp' => "site#homeapp"

  get '/auth/:provider/callback' => 'sessions#create'

  resources :users do
    resources :registrations, only: [:show, :index, :edit, :new]
  end
  
  resources :events, only: [:index, :show]

  resources :registrations

end