class FoodsController < ApplicationController
  def index
    @client = current_user
    @foods = @client.foods.order(created_at: :asc)
    @data = {}
    @foods.each do |food|
      @data[food.name] = { measurement_unit: food.measurement_unit, price: food.price, id: food.id }
    end
  end

  def list
    @foods = current_user.foods.includes(:recipe_foods).order(:id)
    @data = {}
    @total_cost = 0
    @foods.each do |food|
      next if food.recipe_foods.first.nil?
      difference = food.recipe_foods.first.quantity - food.quantity
      next unless difference.positive?

      price = difference * food.price
      @total_cost += price
      @data[food.name] = { difference: difference, price:, unit: food.measurement_unit }
    end

    respond_to do |format|
      format.html { render template: 'foods/list', locals: { foods: @foods } }
    end
  end

  def new
    @client = current_user
    @food = Food.new
  end

  def create
    @client = current_user
    @food = Food.new(food_params)
    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'Food added successfully!'
        else
          flash.now[:error] = 'Food could not be added!'
        end
        redirect_to '/foods'
      end
    end
  end

  def destroy
    @client = current_user
    @food = Food.find(params[:id])
    # authorize! :destroy, @food
    @food.destroy
    redirect_to request.referer
  end

  def food_params
    params.permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
