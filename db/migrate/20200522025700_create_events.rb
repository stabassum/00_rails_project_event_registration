class CreateEvents < ActiveRecord::Migration[5.2]
    def change
        create_table :events do |t|
            t.string :name
            t.string :date
            t.string :location
            t.string :description

            t.timestamps null: false
        end
    end
end