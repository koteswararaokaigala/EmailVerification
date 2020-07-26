Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users
  put '/edit/:id' => 'users#edit', :as => 'edit'
  put '/update_password/:id' => 'users#update_password', :as => 'update_password'
resources :users do
  member do
    get :login, :as => :login
  end   
end
   
end
