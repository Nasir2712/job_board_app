Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get 'users/new'
  get '/jobs', to: 'jobs#jobs_list'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    resources :jobs, only: [:new, :create, :index]
  end
  resources :jobs, only: [:show]
  resources :job_applications, only: [:create]
end
