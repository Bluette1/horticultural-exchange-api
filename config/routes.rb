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

  get '/member-data', to: 'members#show'
  delete '/mod/users/:id', to: 'users#destroy'
  post '/mod/users', to: 'users#create'
  get '/mod/users/', to: 'users#index'
  delete '/admin/users/:id', to: 'users#destroy'
  post '/admin/users', to: 'users#create'
  get '/admin/users/', to: 'users#index'

  post '/mod/users/3/create-user', to: 'users#create'

end
