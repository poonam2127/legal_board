# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :clients do
    resources :questions, only: %i[index new create show] do
      member do
        post 'answers/:answer_id', to: 'questions#approve_answer_payment',
                                   as: :approve_answer_payment
      end
    end
  end

  namespace :lawyers do
    resources :questions, only: [:index] do
      collection do
        get :answered
      end
      resources :answers, only: %i[new create] do
        collection do
          get :view
        end
      end
    end
  end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  devise_scope :user do
    authenticated :user, lambda(&:admin?) do
      root to: 'admin/dashboard#index', as: :admin_root
    end

    authenticated :user, lambda(&:lawyer?) do
      root to: 'lawyers/questions#index', as: :lawyer_root
    end

    authenticated :user, lambda(&:client?) do
      root to: 'clients/questions#index', as: :client_root
    end
  end

  root to: 'clients/questions#index'
end
