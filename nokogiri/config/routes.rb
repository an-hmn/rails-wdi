Nokogiri::Application.routes.draw do
  root :to => 'home#index'
  get '/tumblr' => 'tumblr#show'
end
