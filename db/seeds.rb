# 5.times do
#   Meetup.create(title: "#{Faker::Hacker.noun} #{Faker::Hacker.ingverb}",
#              organizer: Faker::Name.first_name,
#              location: Faker::Address.street_address,
#              img_url: "andrew.jpg",
#              meetup_url: Faker::Internet.url('mockmeetup.com'),
#              description: Faker::Hacker.say_something_smart,
#              event_type: "student",
#              schedule: Faker::Date.forward(5))
# end

a = User.new(username: 'hunter')
a.password = 'hunter'
a.save

t = Token.create(access_token: ENV["SEED_ACCESS_TOKEN"],
                 refresh_token: ENV["SEED_REFRESH_TOKEN"],
                 expires_at: "Thu, 07 Jul 2016 12:23:59 PDT -07:00")
