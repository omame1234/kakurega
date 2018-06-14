Rails.application.routes.draw do
  get 'rooms/index' => 'rooms#index'
  get 'rooms/:id/show' => 'rooms#show'
  get 'rooms/new' => 'rooms#new'
  post 'rooms/create' => 'rooms#create'
  post 'rooms/:id/newpost' => 'rooms#newpost'

  get "/rooms/:id/login" => "rooms#login_form"
  get "/rooms/login" => "rooms#login_form1"
  post "/login" => "rooms#login"

  get 'home/top'


  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"

  get "home/top" => "home#top"
  get "home/about" => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
