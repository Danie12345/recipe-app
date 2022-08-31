Rails.application.routes.draw do
  resources :users do
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :public_recipes]
    resources :foods, only: [:index, :new, :create, :destroy]
    get "/general_shopping_list", to: "foods#show"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#public_recipes"
end
