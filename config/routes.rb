# == Route Map
#
#                 Prefix Verb URI Pattern                                         Controller#Action
# apipie_apipie_checksum GET  /api_doc/apipie_checksum(.:format)                  apipie/apipies#apipie_checksum {:format=>/json/}
#          apipie_apipie GET  /api_doc(/:version)(/:resource)(/:method)(.:format) apipie/apipies#index {:version=>/[^\/]+/, :resource=>/[^\/]+/, :method=>/[^\/]+/}
#        api_v1_contents GET  /api/v1/contents(.:format)                          api/v1/contents#index
#                        POST /api/v1/contents(.:format)                          api/v1/contents#create
#

# frozen_string_literal: true
Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      resources :contents, only: [:index, :create]
    end
  end
end
