require 'google/api_client'

class Calendar
  def initialize(user)
    @user = user
  end

  def events
    result = api_client.execute(:api_method => calendar.events.list,
                            :parameters => {'calendarId' => 'primary'},
                            :authorization => user_credentials)

    result.data
  end

  private

  def api_client
    @client ||= begin
      client = Google::APIClient.new(application_name: 'xxx', application_version: '0.0.1')
      client.authorization.client_id = ENV["GOOGLE_KEY"]
      client.authorization.client_secret = ENV["GOOGLE_SECRET"]
      client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
      client
    end
  end

  def calendar
    @calendar ||= api_client.discovered_api('calendar', 'v3')
  end

  def user_credentials
    auth = api_client.authorization.dup
    # @user.credentials is an OmniAuth::AuthHash  cerated from request.env['omniauth.auth']['credentials']
    auth.update_token!(access_token: @user.credentials.token)
    auth
  end
end
