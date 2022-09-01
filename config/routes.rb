Rails.application.routes.draw do
  get "/foods", to: "foods#index"
  get "/general_shopping_list", to: "foods#list"
  resources :users do
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :public_recipes]
    resources :foods, only: [:new, :create, :destroy]
  end
  root "recipes#public_recipes"
end
