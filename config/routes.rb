Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "register", to: "authentication#register"
      post "login",    to: "authentication#login"
      resources :favorites, only: [ :index, :create, :destroy ]
      resources :cars, only: [ :index ]
    end
  end
end
