class Registration < ActiveRecord::Base

    validates :user_id, presence: true
    validates :event_id, presence: true

    belongs_to :user
    belongs_to :event

    # class level Active Record scope method added

    # this takes a user and returns the user id

    # the below method is basically redundant/re-creating the wheel

    def self.by_user(user_id)
        where(user: user_id)
    end


    # user - 100 users // order them based on registrations descending (them limit it) - limit
    # 
    # registration
    # event

    # the above method is for filtering but routes are not restfult - can choose to take this filter out later, since already can filter in another way

    # find the user with most regisrations / the events that have the most registrations

    # find the user with most registrations - practice this part - below code is incorrect approach, check the user model

    # def self.user_with_most_registered_event
    #     @registrations = Registration.where()
    # end

    # def self.events
    #     where(event: event_id)
    # end

    # find the events. 

    # events have registrations - find the max amount
    # def self.events
    #     where(event: event_id)
    # end

    # def self.max_registrations
    #     where(events.registrations.max)
    # end

end