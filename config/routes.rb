require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    # Your application routes go here
    resources :documents
    if Rails.env.development?
      mount Sidekiq::Web => "/sidekiq"
    end
    root "pages#home"
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.

    # Defines the root path route ("/")
    # root "posts#index"
  end
  get "up" => "rails/health#show", :as => :rails_health_check
end
