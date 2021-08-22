Rails.application.routes.draw do
  resources :wishes
  post '/payment_intents', to: 'payment_intents#create'
  post '/presigned_url', to: 'direct_upload#create'
  devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  namespace :api, defaults: {format: :json} do
    resources :plants
    resources :categories
  end

  namespace :admin do
    resources :users, only: %i[index create destroy]
  end

  namespace :mod do
    resources :users, only: %i[index create destroy]
  end

  get '/member-data', to: 'members#show'

end
