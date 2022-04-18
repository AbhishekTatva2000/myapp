Rails.application.routes.draw do
  get 'password_reset/new'
  get 'password_reset/create'
  root :to => 'main#index'
  
  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  get "sign_in", to: "session#new"
  post "sign_in", to: "session#create"
  
  get 'password', to: "password#edit", as: :edit_password 
  patch 'password', to: "password#update", as: :update_password

  get "home", to: "registration#home"

  get 'session/destroy'
  delete "logout", to: "session#destroy"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create",as: :forgot_password
  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"
end
