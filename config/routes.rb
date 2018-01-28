Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "tomeitoos#index"
  resources :pomodoros
  # resources :pomodoro_settings
  resources :archives

  # pomodoro_settings routing
  get '/pomodoro_settings', to: 'pomodoro_settings#index', as: 'pomodoro_settings'
  post '/pomodoro_settings', to: 'pomodoro_settings#create_or_update', as: 'create_pomodoro_settings'
  patch '/pomodoro_settings', to: 'pomodoro_settings#create_or_update', as: 'update_pomodoro_settings'

end
