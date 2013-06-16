class CreateClaimedItems < ActiveRecord::Migration
  def change
    create_table :assigned_items do |t|
      t.integer :event_item_id
      t.integer :quantity_provided
      t.string :guest_email
      t.string :guest_name
    end
  end
end
