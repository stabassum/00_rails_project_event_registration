class User < ApplicationRecord
  has_secure_password

  validates :email, :presence => true
  validates :username, presence: true

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  has_many :registrations
  has_many :events, through: :registrations

  # scope :max_registrations, -> {order("registrations DESC").limit(1)}

  # scope :max_registrations, -> {order(registrations: :desc).limit(1)}

 # scope :max_registrations, -> {User.limit(1).order(registrations: :desc)}

  # scope :most_registrations, -> {order(registrations: :desc).limit(1)}
  # scope :most_registrations, -> {order(registrations: :desc)} 

  # scope :most_registrations, -> {User.joins(:registrations).group("users.id").order("count(users.id) DESC").limit(1)} 

  # scope :most_registrations, -> {User.joins("left join registrations on registrations.user_id = users.id").group("users.id").order("count(users.id) DESC")}

  # --------
  
  # The method below is returning what I want in the console : tested this out in the console as:
  
  # User.joins(:registrations)
  # User.joins(:regisrtations).group("users.id")
  # User.joins(:regisrtations).group("users.id").order("count(users.id) DESC").limit(1)
  scope :most_registrations, ->  {User.joins(:registrations).group("user.id").order("count(user.id) DESC").limit(1)}


  # This method gets created here:
  # https://www.youtube.com/watch?v=UAvuo-EbTFY (38:00 / 56:18)
  # The "auth_hash" below is set to the value of request.env["omniauth.auth"]
  # in the sessions controller's create action.
  def self.find_or_create_by_omniauth(auth_hash)
    # The "first_or_create" ActiveRecord method will find the first instance
    # where the user's username is the same as the [:info][:name] value inside
    # the auth_hash.  If no such name exists, ActiveRecord will create a new user.
    # "first_or_create" will always return an instance of a user.
    self.where(:username => auth_hash["info"]["name"]).first_or_create do |user|
      # This user is using OmniAuth.  Here we assume they will never need to login
      # to this Rails app using the non-OmniAuth [standard] login means.  To that end,
      # an OmniAuth user will never enter a password on this Rails app (only on GitHub)
      # and so on the next line of code below, we need to assign them a password
      # because the User.rb model requires all users to have such a password.
      # "SecureRandom.hex" will assign a number that hackers won't be able to guess
      user.password = SecureRandom.hex,
      if auth_hash["info"]["email"] == nil # that is, no email address is listed.
        # some GitHub users have their email set to private.  If that is the
        # case, the user's email address will be set to this value below:
        user.email = "unknown: GitHub doesn't share this user's email"
      else # if the user's GitHub account has a public email address...
        # the user's email address in this app will be the same as their GitHub
        # email address.
        user.email = auth_hash["info"]["email"]
      end
    end
  end

  def display_full_name
    self.first_name + " " + self.last_name
  end

  # helper method to refactor view

  def last_updated
      updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
  end


  # User.all 

  # def self.users_with_max_registrations
  #     @user = User.where('max(:events)')
  # end

  # def self.events
  #   where()
  # end

  # Scope level method - class method to find the user with the most registrations
  # first find the 

end
