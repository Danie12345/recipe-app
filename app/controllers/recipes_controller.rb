class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.includes(:user)
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods.includes(:recipe_foods).order(created_at: :desc)
    @data = {}
    @foods.each do |food|
      quantity = food.recipe_foods.first.quantity
      cost = quantity * food.price
      @data[food.name] = { quantity:, cost:, recipe_food_id: food.recipe_foods.first.id }
    end
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def destroy
    current_user.recipes.find(params[:id]).destroy
    redirect_to user_recipes_url(user_id: params[:user_id])
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to user_recipes_path,
                  flash: { success: "#{@recipe.name} has been successfully created!" }
    else
      redirect_to new_recipe_path, flash: { error: @recipe.errors.full_messages }
    end
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
      @data[recipe.name] = { cost: @total_cost }
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
