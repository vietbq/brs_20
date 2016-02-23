class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, default: "", null: false
    add_column :users, :role, :boolean, default: false
    add_column :users, :avatar, :string
  end
end
