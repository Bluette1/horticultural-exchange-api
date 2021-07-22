Rails.application.routes.draw do
  devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  namespace :api, defaults: {format: :json} do
    resources :plants
    resources :categories
  end
  get '/member-data', to: 'members#show'
end
