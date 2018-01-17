Rails.application.routes.draw do
  root "tomeitoos#index"
  resources :pomodoros

end
