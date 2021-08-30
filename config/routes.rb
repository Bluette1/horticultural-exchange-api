Rails.application.routes.draw do
  post '/payment_intents', to: 'payment_intents#create'
  post '/presigned_url', to: 'direct_upload#create'
  devise_for :users, defaults: { format: :json },

    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  namespace :api, defaults: {format: :json} do
    resources :wishes, only: [:destroy, :index]
    resources :cart_items, only: [:destroy, :index]
    resources :plants do
      resources :wishes, only: [:create], controller: 'wishes'
      resources :cart_items, only: [:create], controller: 'cart_items'
    end
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
