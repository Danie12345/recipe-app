class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.includes(:user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    Recipe.destroy params[:id]
    redirect_to user_recipes_url(user_id: params[:user_id])
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
