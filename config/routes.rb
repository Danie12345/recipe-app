Rails.application.routes.draw do
  get "/general_shopping_list", to: "foods#list"
  resources :users do
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :public_recipes]
    resources :foods, only: [:index, :new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#public_recipes"
end
