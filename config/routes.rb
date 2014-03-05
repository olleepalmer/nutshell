Wiki::Application.routes.draw do

  resources :posts

  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "about", to: "pages#about", as: "about"

  devise_for :users, controllers: {
    registrations: 'registrations', sessions: 'sessions' }

  namespace :admin do
    root "base#index"
    resources :users
  end

end
