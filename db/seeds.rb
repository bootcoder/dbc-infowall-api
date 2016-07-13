a = User.new(username: 'hunter')
a.password = 'hunter'
a.save

t = Token.create(access_token: ENV["SEED_ACCESS_TOKEN"],
                 refresh_token: ENV["SEED_REFRESH_TOKEN"],
                 expires_at: "Thu, 07 Jul 2016 12:23:59 PDT -07:00")
