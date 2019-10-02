require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web, at: '/sidekiq'
end
