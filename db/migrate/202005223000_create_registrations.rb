class CreateRegistrations < ActiveRecord::Migration[5.2]
    def change
        create_table :registrations do |t|
            t.string :task_category
            t.string :task_descriptions

            t.string :shirt_size

            t.integer :user_id
            t.integer :event_id

            t.timestamps null: false
        end
    end
end


