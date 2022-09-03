require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'Testing Food validations and methods' do
    before :all do
      @user = User.new(name: 'Mahmoud', email: 'tester@gmail.com')
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.confirm
      @user.save
      @recipe = Recipe.new(name: 'Apple Pie', description: 'description of the recipe', cooking_time: 9.5,
                           preparation_time: 5, user: @user)
      @recipe.save
    end

    after :all do
      User.destroy_all
    end

    it 'name should be present' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'name must not exceed 250 characters' do
      @recipe.name = 'h' * 33
      expect(@recipe).to_not be_valid
    end

    it 'user_id should be present' do
      @recipe.user = nil
      expect(@recipe).to_not be_valid
    end
  end
end
