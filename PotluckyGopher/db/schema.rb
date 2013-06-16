# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130616182610) do

  create_table "assigned_items", :force => true do |t|
    t.integer "event_item_id"
    t.integer "quantity_provided"
    t.string  "guest_email"
    t.string  "guest_name"
    t.string  "url"
  end

  create_table "event_items", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "description"
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
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

e.event_items.each do |pair|
  info << EventItem.where("item_id =?", pair.id)
  info << {name: pair.name, suggestion: pair.suggestion}
end

[
[
#<EventItem id: 5, event_id: 2, name: nil, description: "Important!", item_id: 3, quantity_needed: 17, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 8, event_id: 13, name: nil, description: "Important!", item_id: 3, quantity_needed: 3, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 16, event_id: 11, name: nil, description: "Important!", item_id: 3, quantity_needed: 13, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 18, event_id: 7, name: nil, description: "Important!", item_id: 3, quantity_needed: 20, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">
], 
{:name=>"Balloons", :suggestion=>"nothing yet!"}, 
[
#<EventItem id: 17, event_id: 20, name: nil, description: "Important!", item_id: 20, quantity_needed: 12, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 19, event_id: 2, name: nil, description: "Important!", item_id: 20, quantity_needed: 11, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">
], 
{:name=>"Streamers", :suggestion=>"nothing yet!"}, 
[
#<EventItem id: 9, event_id: 18, name: nil, description: "Important!", item_id: 10, quantity_needed: 19, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 11, event_id: 17, name: nil, description: "Important!", item_id: 10, quantity_needed: 14, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 25, event_id: 2, name: nil, description: "Important!", item_id: 10, quantity_needed: 4, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">
], 
{:name=>"grill", :suggestion=>"nothing yet!"}, 
[
#<EventItem id: 26, event_id: 10, name: nil, description: "Important!", item_id: 16, quantity_needed: 8, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 27, event_id: 2, name: nil, description: "Important!", item_id: 16, quantity_needed: 8, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">
], 
{:name=>"Serving-Utensils", :suggestion=>"nothing yet!"}, 
[
#<EventItem id: 28, event_id: 10, name: nil, description: "Important!", item_id: 14, quantity_needed: 20, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 30, event_id: 2, name: nil, description: "Important!", item_id: 14, quantity_needed: 7, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">
], 
{:name=>"Streamers", :suggestion=>"nothing yet!"}, 
[
#<EventItem id: 4, event_id: 11, name: nil, description: "Important!", item_id: 1, quantity_needed: 19, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 34, event_id: 2, name: nil, description: "Important!", item_id: 1, quantity_needed: 3, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">
], 
{:name=>"Candy", :suggestion=>"nothing yet!"}, 
[
#<EventItem id: 21, event_id: 14, name: nil, description: "Important!", item_id: 11, quantity_needed: 10, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">, 
#<EventItem id: 37, event_id: 2, name: nil, description: "Important!", item_id: 11, quantity_needed: 12, created_at: "2013-06-16 22:16:59", updated_at: "2013-06-16 22:16:59">
], 
{:name=>"Spoons", :suggestion=>"nothing yet!"}]


