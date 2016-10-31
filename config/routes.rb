Rails.application.routes.draw do

  root to: 'cards#events'

  get '/events', to: 'cards#events'
  get '/today', to: 'cards#today'
  get '/mentors', to: 'cards#mentors'
  get '/workshops', to: 'cards#workshops'
  get '/topics', to: 'cards#topics'
  get '/staff', to: 'cards#staff'

end
