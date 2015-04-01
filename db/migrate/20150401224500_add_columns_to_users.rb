class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :avatar_url, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :type, :string
  end
end
