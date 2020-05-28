class Registration < ActiveRecord::Base

    validates :user_id, presence: true
    validates :event_id, presence: true

    belongs_to :user
    belongs_to :event

    # class level Active Record scope method added

    def self.by_user(user_id)
        where(user: user_id)
    end

end