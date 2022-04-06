# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  get "about", to: "about#index"
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"
  get "/search", to: "main#search"

  resources :twitter_accounts
  resources :tweets
  resources :ui_elements
  resources :ui_element_categories
  resources :module_pages do
    collection do
      get 'clone_ae_page'
      post 'save_cloned_ae'
      get 'up_pages'
      get 'sc_pages'
    end
  end
  resources :module_entity_pages
  resources :module_composition_details
  resources :hive_modules do
    collection do
      get 'add_fas'
      get 'add_tcs'
      post 'save_fas'
      post 'save_tcs'
    end
  end

  resources :hive_module_subfunctions do 
    collection do 
      post 'save_pages'
    end
  end

  root to: "main#index"
end
