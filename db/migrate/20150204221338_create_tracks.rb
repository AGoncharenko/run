class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.hstore :data

      t.timestamps null: false
    end
  end
end
