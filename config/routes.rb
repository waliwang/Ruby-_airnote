Rails.application.routes.draw do

  resources :order, only: [:index, :show] do
    member do
      delete :cancel
      #DELETE /orders/2/cacel
    end

    collection do
      delete :cancel
      #DELETE /orders/cacel
    end
  end


  resources :notes
  
  get "/hello", to: "pages#main"
  get "/about", to: "pages#about"
  get "/users", to: "users#profile"

end
