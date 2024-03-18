# frozen_string_literal: true

Rails.application.routes.draw do
  get 'freight_charges/index'
  get 'current_user', to: 'users/current_user#index'
  devise_for :users, path: '', path_names: {
                                 sign_in: 'sign_in',
                                 sign_out: 'sign_out',
                                 registration: 'sign_up'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  namespace :api do
    namespace :v1 do
      resources :companies
      resources :carriers
      resources :freight_charges
    end
  end
end
