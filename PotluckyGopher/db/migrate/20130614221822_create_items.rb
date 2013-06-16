class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :suggestion
      t.string :name
      t.timestamps
    end
  end
end
