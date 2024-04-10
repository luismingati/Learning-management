Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]
  devise_for :users
  resources :courses do
    resources :lessons
  end

  resources :checkouts, only: [:create]

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  namespace :admin do
    resources :courses do
      resources :lessons
    end
    resources :users
  end

  post "/webhook" => "webhooks#stripe"

  patch "/admin/courses/:course_id/lessons/:id/move" => "admin/lessons#move"

  get "up" => "rails/health#show", as: :rails_health_check
  
  get "admin" => "admin#index"

  root "courses#index"
end
