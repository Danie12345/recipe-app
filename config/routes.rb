Rails.application.routes.draw do
  get "/inventory", to: "foods#index"
  get "/general_shopping_list", to: "foods#list"
  resources :users do
    resources :recipes, only: [:show, :new, :create, :destroy, :public_recipes]
    resources :foods, only: [:new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#public_recipes"
end
