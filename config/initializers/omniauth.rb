#config/initalizers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do

  OmniAuth.config.full_host = Rails.env.production? ? 'https://dbc-infowall.herokuapp.com' : 'http://localhost:3000'

  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
  scope: ['email',
    'https://www.googleapis.com/auth/calendar.readonly']}
end
