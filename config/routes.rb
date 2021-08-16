
Rails.application.routes.draw do
  get "/", to: "notes#index"
  resources :notes

  # resources :order, only: [:index, :show] do
  #   member do
  #     delete :cancel
  #     #DELETE /orders/2/cacel
  #   end

  #   collection do
  #     delete :cancel
  #     #DELETE /orders/cacel
  #   end
  # end
  get "/hello", to: "pages#main"
  get "/about", to: "pages#about"

  resources :users, only: [:create] do
    # GET /users/sign_up 註冊表單
    collection do
      get :sign_up
    end

    # get "/users", to: "users#profile"
  end

end
