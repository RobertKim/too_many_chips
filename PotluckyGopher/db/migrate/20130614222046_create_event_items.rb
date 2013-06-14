class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|

    	t.integer :event_id
    	t.integer :item_id

      t.timestamps
    end
  end
end
