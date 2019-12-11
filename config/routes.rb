# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  post 'cal', to: 'pages#cal'
  get 'resize', to: 'pages#resize'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
