class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date :appointment
      t.integer :track_id
      t.integer :user_id
      t.string :slug

      t.timestamps null: false
    end
  end
end