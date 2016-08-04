# frozen_string_literal: true
Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      resources :contents, only: [:index, :create]
    end
  end
end
