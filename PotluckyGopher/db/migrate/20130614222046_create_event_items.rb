class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|

    	t.integer :event_id
    	t.integer :item_id

      t.string  :guest_name
      t.string  :guest_email
      t.integer :quantity_provided

      t.timestamps
    end
  end
end
