class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.includes(:user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    current_user.recipes.find(params[:id]).destroy
    redirect_to user_recipes_url(user_id: params[:user_id])
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @data = {}
    @public_recipes.each do |recipe|
      @recipefoods = RecipeFood.where(recipe_id: recipe.id)
      @foods = Food.where(id: @recipefoods).order(:id)
      @filtered = @foods.zip(@recipefoods).to_h
      @total_cost = 0
      @filtered.each do |food, recipefood|
        @total_cost += food.price * recipefood.quantity
        
      end
      @data[recipe.name] = { cost: @total_cost}
    end
  end
end
