# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
items = %w{ Plates-Luncheon/Dinner Plates
Plates-Cake
Napkins
Napkins
Cups
Forks
Spoons
Knives
Tableclothes
Glasses
Serving-Trays
Serving-Utensils
Doilies
Candy
BottleOpener
Coffee-Pot
Tea-Pot
Centerpiece
Balloons
Streamers
Table-Sprinkles
cheese
pizza
baseball
bats
gloves
grill
ribs
BBQ-sauce
Rubber Stamps}

events = %w{
  bbq
  pool
  potluck
  dinner
  birthday
  babyshower
}

30.times do
  User.create(email: Faker::Internet.email , password: "password" , name: Faker::Name.name )
end

20.times do 
  Event.create(name: events.sample, description: "Awesome Party!", date: Chronic.parse("tomorrow"), location: "#{Faker::Name.name}'s House", url: SecureRandom.urlsafe_base64, user_id: 1 + rand(20))
end

40. times do 
  AssignedItem.create(event_item_id: 1 + rand(20) , quantity_provided: rand(6), guest_email: Faker::Internet.email, guest_name: Faker::Name.name , url: SecureRandom.urlsafe_base64 )
end 

40. times do 
  Item.create(suggestion: "nothing yet!", name: items.sample )
end

40. times do 
  EventItem.create(event_id: 1 + rand(20), description: "Important!", item_id: 1 + rand(20), quantity_needed: 1 + rand(20))
end
