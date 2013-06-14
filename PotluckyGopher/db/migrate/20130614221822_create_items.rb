class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :suggestion
      t.string :name

      t.integer :quantity_needed
      t.integer :quantity_provided
      t.integer :event_id

      t.timestamps
    end
  end
end
