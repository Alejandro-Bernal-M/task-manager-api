Rails.application.routes.draw do
  devise_for :users, class: "Api::V1::User"

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :tasks
        resources :assignments
        resources :usergroups
        resources :groups do
          resources :subgroups
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
