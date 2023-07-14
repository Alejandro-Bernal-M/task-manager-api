Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
      }, path: '', path_names: {
        sign_up: 'registrations'
      }
  
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
