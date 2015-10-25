#config/initalizers/omniauth.rb

OmniAuth.config.full_host = Rails.env.production? ? 'https://dbc-infowall.herokuapp.com' : 'http://localhost:3000'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
    scope: ['email',
      'https://www.googleapis.com/auth/gmail.modify','https://www.googleapis.com/auth/userinfo.email'],
    access_type: 'offline',
    :provider_ignores_state => true,
    :prompt => "select_account",
    setup: (lambda do |env|
      request = Rack::Request.new(env)
      env['omniauth.strategy'].options['token_params'] = {:redirect_uri => 'https://dbc-infowall.herokuapp.com/auth/google_oauth2/callback'}
    end)
    }

end
