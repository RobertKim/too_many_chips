class CreateClaimedItems < ActiveRecord::Migration
  def up
    create_table :assigned_items do |t|
      t.integer :event_item_id
      t.integer :quantity_provided
      t.string :guest_email
      t.string :guest_name
      t.string :url
    end
   remove_column :assigned_items, :guest_name
   remove_column :assigned_items, :guest_email
   remove_column :assigned_items, :url
  end
end


