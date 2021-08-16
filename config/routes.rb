
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
      get :sign_up  # GET/users/sign_up 註冊表單
      get :sign_in  # GET/users/sign_in 登入表單
    end
    # get "/users", to: "users#profile"
  end

  post "/users/sign_in", to: "sessions#create"

end
