Rails.application.routes.draw do
  get 'home/index'
  resources :trn_news do 
    resources :trn_comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :trn_users, controllers: {
    sessions: "trn_users/sessions",
    registrations: "trn_users/registrations"
  }
  # Defines the root path route ("/")
  root "trn_news#index"
end
