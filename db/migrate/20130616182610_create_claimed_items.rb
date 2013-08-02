class CreateClaimedItems < ActiveRecord::Migration
  def up
    create_table :assigned_items do |t|
      t.integer :event_item_id
      t.integer :quantity_provided, :null => false
      t.string :guest_email, :null => false
      t.string :guest_name, :null => false
      t.string :url, :null => false
    end
  end
end


