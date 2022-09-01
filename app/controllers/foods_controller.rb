class FoodsController < ApplicationController
  def index
    @client = current_user
    @foods = @client.foods
    @data = {}
    @foods.each do |food|
      @data[food.name] = { measurement_unit: food.measurement_unit, price: food.price, id: food.id }
    end
  end

  def list
    @recipefoods = RecipeFood.all
    @foods = current_user.foods.where(id: @recipefoods).order(:id)
    @recipefoods = RecipeFood.where(food_id: @foods)
    @filtered = @foods.zip(@recipefoods).to_h
    @data = {}
    @total_cost = 0
    @filtered.each do |food, recipefood|
      difference = food.quantity - recipefood.quantity
      next unless difference.negative?

      price = -difference * food.price
      @total_cost += price
      @data[food.name] = { difference: -difference, price: }
    end

    respond_to do |format|
      format.html { render template: 'foods/list', locals: { foods: @foods } }
    end
  end

  def new
    @client = current_user
    food = Food.new
    respond_to do |format|
      format.html { render :new, locals: { food: } }
    end
  end

  def create
    @client = current_user
    allparams = params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
    allparams['user_id'] = @client.id
    food = Food.new(allparams)
    respond_to do |format|
      format.html do
        if food.save
          flash[:success] = 'Food added successfully!'
          redirect_to user_foods_path(user_id: @client.id)
        else
          flash.now[:error] = 'Error: Food could not be added!'
          render :new, locals: { food: }
        end
      end
    end
  end

  def destroy
    @client = current_user
    @food = Food.find(params[:id])
    @recipefoods = RecipeFood.where(food_id: @food)
    # authorize! :destroy, @recipefoods
    # authorize! :destroy, @food
    @recipefoods.destroy
    @food.destroy
    redirect_to request.referer
  end
end
