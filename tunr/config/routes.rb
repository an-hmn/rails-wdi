Tunr::Application.routes.draw do
  root :to => 'home#index'

  resources :users, :except => [:edit] do
    collection do
      get 'edit'
    end
  end

  resources :albums, :artists, :songs

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
