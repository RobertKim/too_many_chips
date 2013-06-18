class RemoveFirstAndLastNameFromUsers < ActiveRecord::Migration
 def change
    remove_column :users, :first_name, :last_name, :username
    add_column :users, :name, :string
 end
end
