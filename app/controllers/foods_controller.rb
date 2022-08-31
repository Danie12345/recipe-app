class FoodsController < ApplicationController
  def index 
    @foods = Food.all
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
end
