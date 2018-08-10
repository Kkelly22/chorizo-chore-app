Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/join', to: 'households#join'
  post '/complete', to: 'completions#complete'

  resources :chores
  resources :completions

  resources :households do
  	resources :users, only: [:show, :index]
  end

  resources :users do
  	resources :completions, only: [:show, :index]
  	resources :households, only: [:show, :index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
