Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :organizations, only: [:index] do
    collection do
      get :booked_slots
      get :requested_slots
    end
    resources :ad_space_agents do
      resources :slots do
        resources :booked_slots, only: [:new, :create]
      end
    end
  end
  
  resources :ad_space_providers, only: [:index] do     
    resources :slots, only: [:new, :create]
  end
  
  resources :ad_space_agents, only: [:index] do
    collection do
      get :pre_booked_slots
    end
    resources :slots do  
      resources :pre_booked_slots, only: [:create, :new]
    end
  end

  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: 'users/registrations', 
    passwords: 'users/passwords'
  }

  devise_scope :user do
    root 'users/sessions#new'
  end
end
