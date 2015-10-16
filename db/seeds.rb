# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@images = ["fitch.jpg", "jenny.jpg", "kt.jpg", "anne.jpg", "hunter.jpg"]

5.times do
  Event.create(title: "#{Faker::Hacker.noun} #{Faker::Hacker.ingverb}",
             organizer: Faker::Name.first_name,
             location: Faker::Address.street_address,
             img_url: ActionController::Base.helpers.asset_path(@images.pop),
             meetup_url: Faker::Internet.url('mockmeetup.com'),
             description: Faker::Hacker.say_something_smart,
             event_type: "student",
             schedule: Faker::Date.forward(5))
end
