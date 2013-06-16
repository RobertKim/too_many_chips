# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  create_table "assigned_items", :force => true do |t|
    t.integer "event_item_id"
    t.integer "quantity_provided"
    t.string  "guest_email"
    t.string  "guest_name"
  end

  create_table "event_items", :force => true do |t|
    t.integer  "event_id"
    t.integer  "item_id"
    t.integer  "quantity_needed"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "date"
    t.string   "location"
    t.string   "url"
    t.string   "host_provided"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "items", :force => true do |t|
    t.text     "suggestion"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "name"
  end

end

