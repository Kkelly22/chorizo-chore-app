Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :chores
  resources :households
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
