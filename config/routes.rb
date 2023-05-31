Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :technologies
  resources :services
  resources :projects do
    resources :tech_projects, only: [:new, :create, :destroy]
  end

  resources :experiences

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :projects, only: [ :index, :show, :update, :create, :destroy ]
      resources :technologies, only: [ :index ]
      resources :experiences, only: [ :index, :show ]
      resources :services, only:[ :index ]
    end
  end
end
