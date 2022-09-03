require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'Testing Food validations and methods' do

    before :all do
      @user = User.new(name: 'Mahmoud', email: 'tester@gmail.com')
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.confirm
      @user.save
      @food = Food.new(name: 'Apple', measurement_unit: 'kg', price: 9.5, quantity: 5, user: @user)
      @food.save
    end

    after :all do
      User.destroy_all
    end

    it 'name should be present' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'name must not exceed 250 characters' do
      @food.name = 'h' * 251
      expect(@food).to_not be_valid
    end

    it 'price should be a number' do
      @food.price = "AA"
      expect(@food).to_not be_valid
    end

    it 'quantity should be a number' do
      @food.quantity = "k"
      expect(@food).to_not be_valid
    end
  end
end
