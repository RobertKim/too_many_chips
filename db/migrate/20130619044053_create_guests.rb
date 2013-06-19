class CreateGuests < ActiveRecord::Migration
  def up 
    create_table :guests do |t|
      t.string :guest_email
      t.string :guest_name
      t.string :url
    end
    remove_column :assigned_items, :guest_name
    remove_column :assigned_items, :guest_email
    remove_column :assigned_items, :url
  end 

  def down
    drop_table :guests
    add_column :assigned_items, :guest_name
    add_column :assigned_items, :guest_email
    add_column :assigned_items, :url
  end
end
