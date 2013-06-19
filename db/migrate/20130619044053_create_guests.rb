class CreateGuests < ActiveRecord::Migration
  def up 
    create_table :guests do |t|
      t.string :email
      t.string :name
      t.string :url
    end
    remove_column :assigned_items, :guest_name
    remove_column :assigned_items, :guest_email
    remove_column :assigned_items, :url
    add_column :assigned_items, :guest_id, :integer
  end 

  def down
    drop_table :guests
    add_column :assigned_items, :guest_name
    add_column :assigned_items, :guest_email
    add_column :assigned_items, :url
    remove_column :assigned_items, :guest_id
  end
end
