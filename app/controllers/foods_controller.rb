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
end
