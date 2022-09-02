class RecipefoodsController < ApplicationController
  def new
    env_vars
    @recipe = Recipe.find(params[:recipe_id])
    @recipefood = RecipeFood.new
  end

  def create
    env_vars
    @recipefood = RecipeFood.new(recipefood_params)
    respond_to do |format|
      format.html do
        if @recipefood.save
          flash[:success] = 'Food added successfully!'
          redirect_to request.referer
        else
          flash.now[:error] = 'Food could not be added!'
        end
      end
    end
  end

  def destroy
    @recipefood = RecipeFood.find(params[:id])
    @recipefood.destroy
    redirect_to request.referer
  end

  def env_vars
    @client = current_user
    @foods = @client.foods
  end

  def recipefood_params
    params.permit(:quantity, :food_id, :recipe_id)
  end
end
