class Food < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipes_foods
  has_many :recipes :through => :recipes_foods

  def allrecipesfoods
    recipes_foods.order(created_at: :desc)
  end
end
