class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|
    	t.integer :event_id
    	t.string  :name
      t.string  :description
      t.integer :item_id
      t.integer :quantity_needed

      t.timestamps
    end
  end
end
