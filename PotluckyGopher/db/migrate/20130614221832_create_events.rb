class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.time :start_time
      t.time :end_time
      t.date :date
      t.string :location
      t.string :url
      t.string :host_provided
      t.integer :user_id

      t.timestamps
    end
  end
end
