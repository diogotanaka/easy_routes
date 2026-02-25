class AddUsersInformation < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :preferred_method, :string
    add_column :users, :accessibility, :boolean
    add_column :users, :last_namet_name, :string
  end
end
