Rails.application.routes.draw do
  get "/foods", to: "foods#index"
  get "/general_shopping_list", to: "foods#list"
  resources :recipes, only: [:show]
  resources :users do
    resources :recipes, only: [:index, :new, :create, :destroy, :public_recipes] do
      resources :recipefoods, only: [:new, :create, :destroy]
    end
    resources :foods, only: [:new, :create, :destroy]
  end
  root "recipes#public_recipes"
end
