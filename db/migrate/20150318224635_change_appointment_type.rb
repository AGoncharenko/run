class ChangeAppointmentType < ActiveRecord::Migration
  def change
    change_column :trips, :appointment, :datetime
  end
end
