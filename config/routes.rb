Rails.application.routes.draw do

  root 'events#all_cards_today'

  get  'login'  => 'sessions#new'
  post 'login' => 'sessions#create'

  get  'logout' => 'sessions#destroy'
  post 'logout' => 'sessions#destroy'

  get 'events/cards' => 'events#cards'
  get 'cards' => 'events#all_cards_today'
  get 'meetups/cards' => 'meetups#cards'

  resources :users
  resources :meetups
  resources :events
  resources :slides
  resources :marquees

end
