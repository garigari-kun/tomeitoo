Rails.application.routes.draw do
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users
  root "tomeitoos#index"
  resources :pomodoros

end
