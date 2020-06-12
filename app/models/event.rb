class Event < ActiveRecord::Base

    has_many :registrations
    has_many :users, through: :registrations

    # find all of the events that have a name whatever the argument is
    # scope :event -> (event_name) {search_item(event_name)}
    # ? in SQL is placeholder

    # look up turbo links and figure hout how to work with them (how to disable them ni rails 6)

    scope :search_item, -> (event_name) { where("name LIKE ? ", "%#{event_name}%")}

end 