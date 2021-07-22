Rails.application.routes.draw do
  resources :plants
  resources :categories
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
get '/member-data', to: 'members#show'
end
